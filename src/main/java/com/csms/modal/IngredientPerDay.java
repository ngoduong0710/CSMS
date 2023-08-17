/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modal;

/**
 *
 * @author DELL
 */
public class IngredientPerDay {
    private int weight;
    private Ingredient nl;

    public IngredientPerDay() {
    }

    public IngredientPerDay(int weight, Ingredient nl) {
        this.weight = weight;
        this.nl = nl;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public Ingredient getNl() {
        return nl;
    }

    public void setNl(Ingredient nl) {
        this.nl = nl;
    }

    @Override
    public String toString() {
        return weight+"";
    }
    
    
}
