package com.uniquedeveloper.registration;

public class QuizResponse {
    private String gender;
    private int age;
    private boolean diabetes;
    private boolean overweight;
    private boolean hypertension;
    private boolean smoking;
    private boolean injury;
    private boolean cholesterol;
    private boolean painSymptom;
    private boolean fatigueSymptom;
    private boolean nauseaSymptom;
    private boolean feverSymptom;
    private boolean persistentCoughSymptom;
    private boolean unexplainedWeightLossSymptom;
    private boolean cancerFatigueSymptom;
    private boolean bloodInStoolSymptom;
    private int painSeverity;
    private String painFrequency;
    private String painDuration;
    private String painTriggers;
    private String additionalDetails;
    private String painImpact;
    private String painImpactPercentage;

    // Constructeur
    public QuizResponse(String gender, int age, boolean diabetes, boolean overweight, boolean hypertension,
            boolean smoking, boolean injury, boolean cholesterol, boolean painSymptom,
            boolean fatigueSymptom, boolean nauseaSymptom, boolean feverSymptom,
            boolean persistentCoughSymptom, boolean unexplainedWeightLossSymptom,
            boolean cancerFatigueSymptom, boolean bloodInStoolSymptom,
            int painSeverity, String painFrequency, String painDuration,
            String painTriggers, String additionalDetails, String painImpact,
            String painImpactPercentage) {
    		this.gender = gender;
			this.age = age;
			this.diabetes = diabetes;
			this.overweight = overweight;
			this.hypertension = hypertension;
			this.smoking = smoking;
			this.injury = injury;
			this.cholesterol = cholesterol;
			this.painSymptom = painSymptom;
			this.fatigueSymptom = fatigueSymptom;
			this.nauseaSymptom = nauseaSymptom;
			this.feverSymptom = feverSymptom;
			this.persistentCoughSymptom = persistentCoughSymptom;
			this.unexplainedWeightLossSymptom = unexplainedWeightLossSymptom;
			this.cancerFatigueSymptom = cancerFatigueSymptom;
			this.bloodInStoolSymptom = bloodInStoolSymptom;
			this.painSeverity = painSeverity;
			this.painFrequency = painFrequency;
			this.painDuration = painDuration;
			this.painTriggers = painTriggers;
			this.additionalDetails = additionalDetails;
			this.painImpact = painImpact;
			this.painImpactPercentage = painImpactPercentage;
			}

    public QuizResponse() {
		super();
	}

	// Getters
    public String getGender() {
        return gender;
    }

    public int getAge() {
        return age;
    }

    public boolean isDiabetes() {
        return diabetes;
    }

    public boolean isOverweight() {
        return overweight;
    }

    public boolean isHypertension() {
        return hypertension;
    }

    public boolean isSmoking() {
        return smoking;
    }

    public boolean isInjury() {
        return injury;
    }

    public boolean isCholesterol() {
        return cholesterol;
    }

    // Setters
    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setDiabetes(boolean diabetes) {
        this.diabetes = diabetes;
    }

    public void setOverweight(boolean overweight) {
        this.overweight = overweight;
    }

    public void setHypertension(boolean hypertension) {
        this.hypertension = hypertension;
    }

    public void setSmoking(boolean smoking) {
        this.smoking = smoking;
    }

    public void setInjury(boolean injury) {
        this.injury = injury;
    }

   

	public void setCholesterol(boolean cholesterol) {
        this.cholesterol = cholesterol;
    }
	public boolean isPainSymptom() {
        return painSymptom;
    }

    public void setPainSymptom(boolean painSymptom) {
        this.painSymptom = painSymptom;
    }

    public boolean isFatigueSymptom() {
        return fatigueSymptom;
    }

    public void setFatigueSymptom(boolean fatigueSymptom) {
        this.fatigueSymptom = fatigueSymptom;
    }

    public boolean isNauseaSymptom() {
        return nauseaSymptom;
    }

    public void setNauseaSymptom(boolean nauseaSymptom) {
        this.nauseaSymptom = nauseaSymptom;
    }

    public boolean isFeverSymptom() {
        return feverSymptom;
    }

    public void setFeverSymptom(boolean feverSymptom) {
        this.feverSymptom = feverSymptom;
    }

    public boolean isPersistentCoughSymptom() {
        return persistentCoughSymptom;
    }

    public void setPersistentCoughSymptom(boolean persistentCoughSymptom) {
        this.persistentCoughSymptom = persistentCoughSymptom;
    }

    public boolean isUnexplainedWeightLossSymptom() {
        return unexplainedWeightLossSymptom;
    }

    public void setUnexplainedWeightLossSymptom(boolean unexplainedWeightLossSymptom) {
        this.unexplainedWeightLossSymptom = unexplainedWeightLossSymptom;
    }

    public boolean isCancerFatigueSymptom() {
        return cancerFatigueSymptom;
    }

    public void setCancerFatigueSymptom(boolean cancerFatigueSymptom) {
        this.cancerFatigueSymptom = cancerFatigueSymptom;
    }

    public boolean isBloodInStoolSymptom() {
        return bloodInStoolSymptom;
    }

    public void setBloodInStoolSymptom(boolean bloodInStoolSymptom) {
        this.bloodInStoolSymptom = bloodInStoolSymptom;
    }

    public int getPainSeverity() {
        return painSeverity;
    }

    public void setPainSeverity(int painSeverity) {
        this.painSeverity = painSeverity;
    }

    public String getPainFrequency() {
        return painFrequency;
    }

    public void setPainFrequency(String painFrequency) {
        this.painFrequency = painFrequency;
    }

    public String getPainDuration() {
        return painDuration;
    }

    public void setPainDuration(String painDuration) {
        this.painDuration = painDuration;
    }

    public String getPainTriggers() {
        return painTriggers;
    }

    public void setPainTriggers(String painTriggers) {
        this.painTriggers = painTriggers;
    }

    public String getAdditionalDetails() {
        return additionalDetails;
    }

    public void setAdditionalDetails(String additionalDetails) {
        this.additionalDetails = additionalDetails;
    }

    public String getPainImpact() {
        return painImpact;
    }

    public void setPainImpact(String painImpact) {
        this.painImpact = painImpact;
    }

    public String getPainImpactPercentage() {
        return painImpactPercentage;
    }

    public void setPainImpactPercentage(String painImpactPercentage) {
        this.painImpactPercentage = painImpactPercentage;
    }
}

