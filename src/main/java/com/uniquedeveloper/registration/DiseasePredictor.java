package com.uniquedeveloper.registration;

import java.util.ArrayList;
import java.util.List;

public class DiseasePredictor {

    public List<String> predictDiseases(int age, boolean diabetes, boolean overweight, boolean hypertension,
                                        boolean smoking, boolean injury, boolean cholesterol,
                                        boolean painSymptom, boolean fatigueSymptom, boolean nauseaSymptom,
                                        boolean feverSymptom, boolean persistentCoughSymptom,
                                        boolean unexplainedWeightLossSymptom, boolean cancerFatigueSymptom,
                                        boolean bloodInStoolSymptom, int painSeverity, String painFrequency,
                                        String painDuration, String painTriggers, String additionalDetails,
                                        String painImpact, String painImpactPercentage, String gender) {

        List<String> predictedDiseases = new ArrayList<>();

        // Logique de prédiction des maladies basée sur les symptômes

        // Exemple 1 : Grippe
        if (feverSymptom && persistentCoughSymptom) {
            predictedDiseases.add("Grippe");
        }

        // Exemple 2 : Cancer gynécologique chez les femmes
        if ("female".equalsIgnoreCase(gender)) {
            if (painSymptom && nauseaSymptom && unexplainedWeightLossSymptom) {
                predictedDiseases.add("Cancer gynécologique");
            } else if (painSymptom && persistentCoughSymptom && fatigueSymptom) {
                predictedDiseases.add("Cancer du poumon chez les femmes");
            } else if (bloodInStoolSymptom) {
                predictedDiseases.add("Cancer colorectal chez les femmes");
            }
        }

        // Exemple 3 : Hypertension
        if (hypertension) {
            predictedDiseases.add("Hypertension");
        } else {
            predictedDiseases.add("Hypotension");
        }

        // Exemple 4 : Diabète
        if (diabetes) {
            predictedDiseases.add("Diabète");
        } else {
            predictedDiseases.add("Hypoglycémie");
        }

        // Exemple 5 : Maladie cardiaque
        if (smoking && cholesterol) {
            predictedDiseases.add("Maladie cardiaque");
        }

        // Exemple 6 : Obésité
        if (overweight) {
            predictedDiseases.add("Obésité");
        } else {
            predictedDiseases.add("Insuffisance pondérale");
        }

        // Exemple 7 : Blessure
        if (injury) {
            predictedDiseases.add("Blessure");
        }

        // Exemple 8 : Anémie
        if (fatigueSymptom ) {
            predictedDiseases.add("Anémie");
        } else {
            predictedDiseases.add("Déshydratation");
        }

        // Exemple 9 : Maladie pulmonaire
        if (persistentCoughSymptom && smoking) {
            predictedDiseases.add("Maladie pulmonaire");
        } else {
            predictedDiseases.add("Asthme");
        }

        // Exemple 10 : Maladie gastro-intestinale
        if (nauseaSymptom && bloodInStoolSymptom) {
            predictedDiseases.add("Maladie gastro-intestinale");
        } else {
            predictedDiseases.add("Intoxication alimentaire");
        }

        // Exemple 11 : Maladie de la thyroïde chez les femmes
        if ("female".equalsIgnoreCase(gender)) {
            if (fatigueSymptom ) {
                predictedDiseases.add("Maladie de la thyroïde chez les femmes");
            }
        }

        // Exemple 12 : Endométriose
        
        // Exemple 13 : Fibromes utérins
        

        // Ajoutez d'autres conditions pour les autres symptômes et maladies

        return predictedDiseases;
    }
}
