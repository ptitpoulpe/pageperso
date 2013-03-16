#!/usr/bin/env python
# -*- coding: utf-8 -*-
# author: Paul Bédaride
# date: 21 april 2011

from itertools import *
import urllib2
import multiprocessing as MP
import re
import sys
sys.setrecursionlimit(100000)

def calculate(a):
    #print 'calc:', a[1][-3]
    return a[0](*a[1])

def multimap(f):
    #res = big_pool.map_async(calculate, f)
    res = big_pool.imap_unordered(calculate, f)
    return res

def grouper(n, iterable, fillvalue=None):
    "grouper(3, 'ABCDEFG', 'x') --> ABC DEF Gxx"
    args = [iter(iterable)] * n
    return izip_longest(fillvalue=fillvalue, *args)

def inc_inst(stack):
    if stack:
        ls = stack[-1]
        stack[-1] = (ls[0], ls[1]+1)
    return stack

def new_funcs(old_funcs, fid, iid, action):
    nf = [f[:] for f in old_funcs]
    nf[fid][iid] = action
    return nf

angle = [(1,0), (0,-1), (-1,0), (0,1)]
min_stars = 1000
# add argument of set of (pos, stack) to check loop
def step(grid, pos, dir, stars, funcs, stack, n,
         done=None, actions=None, colors=['rgb'], parallel=True, debug='root'):
    #print len(stars), pos, grid[pos[0]][pos[1]], dir, funcs, stack, n, debug
    #print 'stars(%s)'%len(stars),
    if actions is None:
        actions = [('a',), ('r',), ('l',)] + [('f', i) for i in range(len(funcs))]
        actions = [(a[0], c, a[-1])  for c in colors for a in actions]
    if done is None:
        done = frozenset()
    if len(stack)==0 or n<=0:
        return None
    global min_stars
    min_stars = min(min_stars, len(stars))
    la_fun_id, la_inst_id = stack[-1]
    la_fun = funcs[la_fun_id]
    if la_inst_id>=len(la_fun):
        n_stack = inc_inst(stack[:-1])
        return step(grid, pos, dir, stars, funcs, n_stack, n,
                    done, actions, colors, False, 'backtrack')
    else:
        inst = la_fun[la_inst_id]
        if inst==None:
            if parallel:
                ress = multimap((step, (grid, pos, dir, stars,
                                        new_funcs(funcs, la_fun_id, la_inst_id, action),
                                        stack, n, done, actions, colors, False, 'created inst'))
                                for action in actions)
                for res in ress:
                    if res is not None:
                        big_pool.terminate()
                        return res
            else:
                for action in actions:
                    la_fun[la_inst_id] = action
                    res = step(grid, pos, dir, stars, funcs, stack, n,
                               done, actions, colors, parallel, 'created inst')
                    if res is not None:
                        return res
            la_fun[la_inst_id] = None
            #print "all actions denied"
            return None
        else:
            x, y = pos
            if grid[x][y] not in inst[1]:
                return step(grid, pos, dir, stars, funcs, inc_inst(stack[:]), n,
                            done, actions, colors, parallel, 'pass')
            if inst[0]=='l':
                return step(grid, pos, (dir+1)%4, stars, funcs, inc_inst(stack[:]), n-1,
                            done, actions, colors, parallel, 'right')
            elif inst[0]=='r':
                return step(grid, pos, (dir-1)%4, stars, funcs, inc_inst(stack[:]), n-1,
                            done, actions, colors, parallel, 'left')
            elif inst[0]=='a':
                n_pos = tuple(map(sum, zip(pos, angle[dir])))
                x, y = n_pos
                if x<0 or x>=len(grid) or y<0 or y>=len(grid[x]) or grid[x][y] is None:
                    #print 'move impossible:', n_pos, grid[x][y]
                    return None
                state = (n_pos, dir, stack[-1])
                if state in done:
                    return None
                else:
                    done = done.union([state])
                n_stars = stars - set([n_pos])
                if len(n_stars)==0:
                    #print "accepted"
                    print 'res:', funcs
                    return funcs
                return step(grid, n_pos, dir, n_stars, funcs, inc_inst(stack[:]), n-1,
                            done, actions, colors, parallel, 'foward')
            elif inst[0]=='f':
                return step(grid, pos, dir, stars, funcs, stack + [(inst[2],0)], n,
                            done, actions, colors, parallel, 'func call')

def resolve(id):
    infos = get_puzzle_infos(id)
    return step(infos['grid'],
                (infos['robotCol'], infos['robotRow']), 
                infos['robotDir'], 
                infos['stars'], 
                infos['subs'], 
                [(0,0)],
                1000,
                colors=infos['colors']) 

def get_puzzle_infos(id):
    html = urllib2.urlopen("http://www.robozzle.com/js/play.aspx?puzzle=%s"%id).read()
    puzzle = re.findall(r"var puzzles = \[\{(.*?)\}\];", html, re.DOTALL)
    infos = dict(re.findall(r'(\w+):"?(.*?)"?,?$', puzzle[0], re.MULTILINE))
    for i in ['robotCol', 'robotRow', 'robotDir', 'subs']:
        infos[i] = eval(infos[i])
    infos['subs'] = funcs =  [[None]*x for x in infos['subs'] if x!=0]
    stars, grid, colors = board2gridstars(infos['board'])
    infos['stars'] = stars
    infos['grid'] = grid
    infos['colors'] = colors
    return infos

def board2gridstars(txt):
    stars = set()
    grid = []
    colors = set()
    for y, line in enumerate(grouper(16, txt)):
        g_line = []
        for x, cell in enumerate(line):
            if cell.isupper():
                stars.add( (x,y) )
            if cell==" ":
                g_line.append(None)
            else:
                colors.add(cell.lower())
                g_line.append(cell.lower())
        grid.append(g_line)
    return stars, zip(*grid), [''.join(colors)]+list(colors)

big_pool = MP.Pool(100)
if __name__=="__main__":
    big_pool = MP.Pool(100)
    resolve(sys.argv[1])
    big_pool.join()
