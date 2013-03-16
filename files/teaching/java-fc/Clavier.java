import java.io.*;

public class Clavier {
	//Methodes
	public static int toInt(String s) {
	int result=0;
	try { // Try recupere les erreurs au lieu de faire planter le programme
	  result=Integer.valueOf(s).intValue(); // en cas de mauvaise saisie le programme lance une erreur qui ferait stopper le programme sans try
	}
	catch (NumberFormatException e) { // Attrape les erreur que le try a recu. NumberFormatException est le type de l'erreur possible
	  System.err.println("Erreur de format: "+e.getMessage()); // Affiche a l'ecran les informations sur l'erreur attrapé
	  System.out.print ("recommencez : "); // Proposition de recommencer
	  return lireInt();// On retourne le resultat d'un second appelle a la methode lireInt()
	}
	return result; // retour en cas de bon fonctionnement de la methode
	}
  public static String lireString() {
	BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	String result;
	try {
	  result=br.readLine();
	} catch (IOException e) {
	  System.err.println("Erreur de lecture: "+e.getMessage());
	  result="";
	}
	return result;
  }
  public static int lireInt() {
	return toInt(lireString());
  }
}