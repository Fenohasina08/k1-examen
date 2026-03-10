public class CoutParMecanicien {

    private String marque;
    private String nomMecanicien;
    private double coutReparation;

    public void setMarque(String marque) {
        this.marque = marque;
    }

    public void setNomMecanicien(String nomMecanicien) {
        this.nomMecanicien = nomMecanicien;
    }

    public void setCoutReparation(double coutReparation) {
        this.coutReparation = coutReparation;
    }

    public String getMarque() {
        return marque;
    }

    public String getNomMecanicien() {
        return nomMecanicien;
    }

    public double getCoutReparation() {
        return coutReparation;
    }

    public boolean equals(Object object) {
        if (object == null || getClass() != object.getClass()) return false;
        if (!super.equals(object)) return false;
        CoutParMecanicien that = (CoutParMecanicien) object;
        return java.lang.Double.compare(coutReparation, that.coutReparation) == 0 && java.util.Objects.equals(marque, that.marque) && java.util.Objects.equals(nomMecanicien, that.nomMecanicien);
    }

    public int hashCode() {
        return Objects.hash(super.hashCode(), marque, nomMecanicien, coutReparation);
    }
}