package com.uniquedeveloper.registration;

public class HealthAnalyzer {

    public static String predictEndometriosisWithRisk(String pelvicPain, String painfulMenstruation, String fatigue, String painDuringIntercourse) {
        int score = 0;

        int pelvicPainScore = 3;
        int painfulMenstruationScore = 2;
        int fatigueScore = 1;
        int painDuringIntercourseScore = 2;

        int maxPossibleScore = pelvicPainScore + painfulMenstruationScore + fatigueScore + painDuringIntercourseScore;

        int selectedSymptoms = 0;

        if ("true".equals(pelvicPain)) {
            score += pelvicPainScore;
            selectedSymptoms++;
        }
        if ("true".equals(painfulMenstruation)) {
            score += painfulMenstruationScore;
            selectedSymptoms++;
        }
        if ("true".equals(fatigue)) {
            score += fatigueScore;
            selectedSymptoms++;
        }
        if ("true".equals(painDuringIntercourse)) {
            score += painDuringIntercourseScore;
            selectedSymptoms++;
        }

        double percentagePerSymptom = (double) 100 / selectedSymptoms;

        // Calculate the percentage for each symptom with 2 decimal places
        String pelvicPainPercentage = (selectedSymptoms > 0 && "true".equals(pelvicPain)) ? String.format("%.2f", percentagePerSymptom) : "0.00";
        String painfulMenstruationPercentage = (selectedSymptoms > 0 && "true".equals(painfulMenstruation)) ? String.format("%.2f", percentagePerSymptom) : "0.00";
        String fatiguePercentage = (selectedSymptoms > 0 && "true".equals(fatigue)) ? String.format("%.2f", percentagePerSymptom) : "0.00";
        String painDuringIntercoursePercentage = (selectedSymptoms > 0 && "true".equals(painDuringIntercourse)) ? String.format("%.2f", percentagePerSymptom) : "0.00";

        // Define a threshold for categorizing risk levels
        if (score >= 8) {
            return "High Risk: You may have Endometriosis. It is recommended to consult with a gynecologist for further evaluation, possibly including imaging studies or a laparoscopy."
                    + "\nPelvic Pain: " + pelvicPainPercentage + "%"
                    + "\nPainful Menstruation: " + painfulMenstruationPercentage + "%"
                    + "\nFatigue: " + fatiguePercentage + "%"
                    + "\nPain During Intercourse: " + painDuringIntercoursePercentage + "%";
        } else if (score >= 5) {
            return "Medium Risk: You may have Endometriosis. It is advisable to consult with a healthcare professional for further evaluation."
                    + "\nPelvic Pain: " + pelvicPainPercentage + "%"
                    + "\nPainful Menstruation: " + painfulMenstruationPercentage + "%"
                    + "\nFatigue: " + fatiguePercentage + "%"
                    + "\nPain During Intercourse: " + painDuringIntercoursePercentage + "%";
        } else {
            return "Low Risk: No specific prediction for Endometriosis based on provided symptoms."
                    + "\nPelvic Pain: " + pelvicPainPercentage + "%"
                    + "\nPainful Menstruation: " + painfulMenstruationPercentage + "%"
                    + "\nFatigue: " + fatiguePercentage + "%"
                    + "\nPain During Intercourse: " + painDuringIntercoursePercentage + "%";
        }
    }

    public static String predictPCOS(String irregularMenstruation, String abnormalBleeding, String weightGain, String acne, String hirsutism) {
        int selectedSymptoms = 0;

        int score = 0;

        int irregularMenstruationScore = 1;
        int abnormalBleedingScore = 1;
        int weightGainScore = 1;
        int acneScore = 1;
        int hirsutismScore = 1;

        if ("true".equals(irregularMenstruation)) {
            score += irregularMenstruationScore;
            selectedSymptoms++;
        }
        if ("true".equals(abnormalBleeding)) {
            score += abnormalBleedingScore;
            selectedSymptoms++;
        }
        if ("true".equals(weightGain)) {
            score += weightGainScore;
            selectedSymptoms++;
        }
        if ("true".equals(acne)) {
            score += acneScore;
            selectedSymptoms++;
        }
        if ("true".equals(hirsutism)) {
            score += hirsutismScore;
            selectedSymptoms++;
        }

        // Ensure there is at least one selected symptom to avoid division by zero
        selectedSymptoms = Math.max(selectedSymptoms, 1);

        int maxPossibleScore = irregularMenstruationScore + abnormalBleedingScore + weightGainScore + acneScore + hirsutismScore;

        double percentagePerSymptom = (double) 100 / selectedSymptoms;

        // Calculate the percentage for each symptom with 2 decimal places
        String irregularMenstruationPercentage = (selectedSymptoms > 0 && "true".equals(irregularMenstruation)) ? String.format("%.2f", percentagePerSymptom) : "0.00";
        String abnormalBleedingPercentage = (selectedSymptoms > 0 && "true".equals(abnormalBleeding)) ? String.format("%.2f", percentagePerSymptom) : "0.00";
        String weightGainPercentage = (selectedSymptoms > 0 && "true".equals(weightGain)) ? String.format("%.2f", percentagePerSymptom) : "0.00";
        String acnePercentage = (selectedSymptoms > 0 && "true".equals(acne)) ? String.format("%.2f", percentagePerSymptom) : "0.00";
        String hirsutismPercentage = (selectedSymptoms > 0 && "true".equals(hirsutism)) ? String.format("%.2f", percentagePerSymptom) : "0.00";

        if ("true".equals(irregularMenstruation) || "true".equals(abnormalBleeding) || "true".equals(weightGain) || "true".equals(acne) || "true".equals(hirsutism)) {
            // Calculate the risk level based on the total score
            String riskLevel;
            if (score >= 4) {
                riskLevel = "High Risk";
            } else if (score >= 2) {
                riskLevel = "Medium Risk";
            } else {
                riskLevel = "Low Risk";
            }

            return "You may have Polycystic Ovary Syndrome (PCOS). It is recommended to consult with an endocrinologist or a reproductive endocrinology specialist for further evaluation and hormonal testing."
                    + "\nRisk Level: " + riskLevel
                    + "\nIrregular Menstruation: " + irregularMenstruationPercentage + "%"
                    + "\nAbnormal Bleeding: " + abnormalBleedingPercentage + "%"
                    + "\nWeight Gain: " + weightGainPercentage + "%"
                    + "\nAcne: " + acnePercentage + "%"
                    + "\nHirsutism: " + hirsutismPercentage + "%";
        } else {
            return "No specific prediction for PCOS based on provided symptoms.";
        }
    }



public static String predictPrematureOvarianFailure(String irregularOvulation, String menstrualIrregularities, String hotFlashes, String vaginalDryness, String moodSwings) {
    if ("true".equals(irregularOvulation) && "true".equals(menstrualIrregularities) && "true".equals(hotFlashes) && "true".equals(vaginalDryness) && "true".equals(moodSwings)) {
        return "You may have Premature Ovarian Failure. It is recommended to consult with a gynecologist or an endocrinologist for further evaluation and hormonal testing.";
    } else {
        return "No specific prediction for Premature Ovarian Failure based on provided symptoms.";
    }
}

public static String predictUterineFibroids(String pelvicPain, String heavyMenstrualBleeding, String backPain, String frequentUrination) {
    if ("true".equals(pelvicPain) && "true".equals(heavyMenstrualBleeding) && "true".equals(backPain) && "true".equals(frequentUrination)) {
        return "You may have Uterine Fibroids. It is recommended to consult with a gynecologist for further evaluation, possibly including imaging studies.";
    } else {
        return "No specific prediction for Uterine Fibroids based on provided symptoms.";
    }
}

public static String predictOvarianCysts(String pelvicPain, String bloating, String irregularMenstruation) {
    if ("true".equals(pelvicPain) && "true".equals(bloating) && "true".equals(irregularMenstruation)) {
        return "You may have Ovarian Cysts. It is recommended to consult with a gynecologist for further evaluation, possibly including imaging studies.";
    } else {
        return "No specific prediction for Ovarian Cysts based on provided symptoms.";
    }
}

public static String predictBacterialVaginosis(String vaginalDischarge, String itching, String burningDuringUrination) {
    if ("true".equals(vaginalDischarge) && "true".equals(itching) && "true".equals(burningDuringUrination)) {
        return "You may have Bacterial Vaginosis. It is recommended to consult with a healthcare professional for further evaluation and appropriate treatment.";
    } else {
        return "No specific prediction for Bacterial Vaginosis based on provided symptoms.";
    }
}

public static String predictCandidiasis(String vaginalItching, String thickWhiteDischarge, String painDuringIntercourse) {
    if ("true".equals(vaginalItching) && "true".equals(thickWhiteDischarge) && "true".equals(painDuringIntercourse)) {
        return "You may have Candidiasis (Yeast Infection). It is recommended to consult with a healthcare professional for further evaluation and appropriate antifungal treatment.";
    } else {
        return "No specific prediction for Candidiasis based on provided symptoms.";
    }
}

public static String predictPID(String pelvicPain, String abnormalVaginalDischarge, String painfulUrination) {
    if ("true".equals(pelvicPain) && "true".equals(abnormalVaginalDischarge) && "true".equals(painfulUrination)) {
        return "You may have Pelvic Inflammatory Disease (PID). It is recommended to consult with a healthcare professional for further evaluation, which may include laboratory tests and imaging studies.";
    } else {
        return "No specific prediction for PID based on provided symptoms.";
    }
}

public static String predictUterineCancer(String abnormalVaginalBleeding, String pelvicPain, String painDuringIntercourse) {
    if ("true".equals(abnormalVaginalBleeding) && "true".equals(pelvicPain) && "true".equals(painDuringIntercourse)) {
        return "You may have Uterine Cancer. It is recommended to consult with a gynecologic oncologist for further evaluation, which may include imaging studies and a biopsy.";
    } else {
        return "No specific prediction for Uterine Cancer based on provided symptoms.";
    }
}

public static String predictDisease(String disease, String symptom1, String symptom2, String symptom3, String symptom4,String symptom5 ) {
    switch (disease) {
        case "Endometriosis":
            return predictEndometriosisWithRisk(symptom1, symptom2, symptom3, symptom4);
        case "PCOS":
            return predictPCOS(symptom1, symptom2, symptom3, symptom4, symptom5);
        case "PrematureOvarianFailure":
            return predictPrematureOvarianFailure(symptom1, symptom2, symptom3, symptom4, symptom5);
        case "UterineFibroids":
            return predictUterineFibroids(symptom1, symptom2, symptom3, symptom4);
        case "OvarianCysts":
            return predictOvarianCysts(symptom1, symptom2, symptom3);
        case "BacterialVaginosis":
            return predictBacterialVaginosis(symptom1, symptom2, symptom3);
        case "Candidiasis":
            return predictCandidiasis(symptom1, symptom2, symptom3);
        case "PID":
            return predictPID(symptom1, symptom2, symptom3);
        case "UterineCancer":
            return predictUterineCancer(symptom1, symptom2, symptom3);
        default:
            return "No specific prediction for " + disease + " based on provided symptoms.";
    }
}
}