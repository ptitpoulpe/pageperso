
import java.util.GregorianCalendar;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Periode {
	
	static DateFormat dfe = new SimpleDateFormat("HH'h'mm dd-MM-yy");
	static DateFormat dfsd = new SimpleDateFormat("EEEE d MMMM yy, HH'h'mm");
	static DateFormat dfsf = new SimpleDateFormat("-HH'h'mm");

	GregorianCalendar debut;
	GregorianCalendar fin;
	
	Periode(String debut, String fin){
		this.debut = new GregorianCalendar();
		this.fin = new GregorianCalendar();
		try{
			this.debut.setTime(dfe.parse(debut));
			this.fin.setTime(dfe.parse(fin));
		} catch (ParseException e) {
			System.err.println("Erreur de formatage.");
		}
		if (this.debut.after(this.fin))
			System.err.println("Début de la période après la fin.");
	}
	
	Periode(String debut, int duree){
		this.debut = new GregorianCalendar();
		try{
			this.debut.setTime(dfe.parse(debut));
		} catch (ParseException e) {
			System.err.println("Erreur de formatage ");
		}
		this.fin = (GregorianCalendar)this.debut.clone();
		this.fin.add(GregorianCalendar.HOUR, duree);
	}
	
	public boolean intersect(Periode with){
		return this.debut.after(with.debut) & this.debut.before(with.fin) |
				this.fin.after(with.debut) & this.fin.before(with.fin) |
				this.debut.before(with.debut) & this.fin.after(with.fin);
	}
	
	public String toString() {
		return dfsd.format(this.debut.getTime()) + dfsf.format(this.fin.getTime());
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Periode p1 = new Periode("10h0 05-04-2008","10h05 05-04-2008");
		Periode p2 = new Periode("9h00 05-04-2008",2);
		Periode p3 = new Periode("11h00 05-04-2008",2);
		Periode p4 = new Periode("10h00 05-04-2008",2);
		System.out.println(p1);
		System.out.println(p2);
		System.out.println(p3);
		System.out.println(p4);
		System.out.println("Intersection p1-p2 (true): " + p1.intersect(p2));
		System.out.println("Intersection p1-p3 (false): " + p1.intersect(p3));
		System.out.println("Intersection p1-p4 (true): " + p1.intersect(p4));
		System.out.println("Intersection p2-p3 (false): " + p2.intersect(p3));
		System.out.println("Intersection p2-p4 (true): " + p2.intersect(p4));
		System.out.println("Intersection p3-p4 (true): " + p3.intersect(p4));
	}

}
