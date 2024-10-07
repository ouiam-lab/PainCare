<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.uniquedeveloper.registration.SaveQuizResponseInDatabase" %>
    <%@ page import="com.uniquedeveloper.registration.QuizResponse" %>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz - PainCare</title>
    <style>
        /* Votre CSS existant reste inchangé */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            font-size: 16px;
        }

        header {
            background-color: #3498db;
            color: #fff;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .lang-container {
            display: flex;
            align-items: center;
        }

        .lang-dropdown {
            background-color: #3498db;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
        }

        .lang-dropdown:hover {
            background-color: #2980b9;
        }

        .lang-options {
            display: none;
            position: absolute;
            background-color: #3498db;
            min-width: 160px;
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .lang-options a {
            color: #fff;
            padding: 12px 16px;
            display: block;
            text-align: left;
            text-decoration: none;
        }

        .lang-options a:hover {
            background-color: #2980b9;
        }

        #quiz-container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .question-container {
            margin-bottom: 20px;
        }

        .question {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .options {
            display: flex;
            flex-wrap: wrap;
        }

        .option {
            background-color: #3498db;
            color: #fff;
            padding: 10px;
            margin: 5px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .option:hover {
            background-color: #2980b9;
        }

        #navigation-bar {
            background-color: #3498db;
            display: flex;
            justify-content: space-between;
            padding: 10px;
            max-width: 800px;
            margin: 20px auto;
            border-radius: 8px;
        }

        .navigation-button {
            background-color: #fff;
            color: #3498db;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .navigation-button:hover {
            background-color: #f4f4f4;
        }

        /* Styles pour le curseur (range) */
        /* Styles pour le curseur (range) */
/* Styles pour le curseur (range) */
/* Styles pour le curseur (range) */
/* Styles pour le curseur (range) */
input[type="range"] {
    -webkit-appearance: none;
    margin: 10px 0;
    width: 100%;
    height: 10px; /* Hauteur du curseur */
    border-radius: 5px;
    background-color: #ddd; /* Couleur de fond du curseur non sélectionné */
}

input[type="range"]::-webkit-slider-thumb {
    -webkit-appearance: none;
    height: 20px;
    width: 20px;
    background-color: #3498db;
    border-radius: 50%;
    border: 2px solid #fff;
    cursor: pointer;
    margin-top: -5px; /* Ajustement vertical du curseur sélectionné par rapport à la piste */
}

input[type="range"]::-webkit-slider-runnable-track {
    width: 100%;
    height: 10px;
    cursor: pointer;
    background-color: #3498db;
    border-radius: 5px;
}

.percentage-slider-container {
        position: relative;
        width: 80%;
        margin: 20px auto;
    }

    input[type="range"] {
        -webkit-appearance: none;
        width: 100%;
        height: 10px;
        border-radius: 5px;
        background-color: #ddd;
        outline: none;
        margin-top: 10px;
    }

    input[type="range"]::-webkit-slider-thumb {
        -webkit-appearance: none;
        width: 20px;
        height: 20px;
        background-color: #3498db;
        border-radius: 50%;
        border: 2px solid #fff;
        cursor: pointer;
        margin-top: -5px;
    }

    .percentage-value {
        position: absolute;
        top: -30px;
        left: 50%;
        transform: translateX(-50%);
        font-size: 16px;
        color: #3498db;
    }
/* Styles specifically for the pain severity scale */
    .pain-severity-container {
        width: 80%;
        margin: 10px 0;
        position: relative;
    }

    .pain-severity-container input[type="range"] {
        width: 100%;
        appearance: none;
        height: 20px;
        border-radius: 10px;
        background: #ecf0f1;
        outline: none;
        opacity: 0.7;
        transition: opacity 0.2s;
    }

    .pain-severity-container input[type="range"]:hover {
        opacity: 1;
    }

    .pain-severity-container input[type="range"]::-webkit-slider-thumb {
        appearance: none;
        width: 30px;
        height: 30px;
        border-radius: 50%;
        background: #3498db;
        cursor: pointer;
        transform: translateY(-50%);
        margin-top: -5px;
        box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
    }

    .pain-severity-container output {
        display: block;
        margin-top: 10px;
        text-align: center;
        color: #3498db;
        font-weight: bold;
    }

    </style>
</head>

<body>

    <header>
        <h1>PainCare</h1>
        <div class="lang-container">
            <div class="lang-dropdown" onclick="toggleLanguageDropdown()">Langue</div>
            <div class="lang-options" id="langOptions">
                <a href="#" onclick="changeLanguage('fr')">Français</a>
                <a href="#" onclick="changeLanguage('en')">English</a>
            </div>
        </div>
    </header>
 <form id="quizForm" action="healthAnalyzer" method="post" onsubmit="return validateQuiz()">
    <div id="quiz-container">
        <!-- Première question -->
        <div class="question-container" style="display: block;">
            <div class="question">
                <p><strong>Check your symptoms</strong></p>
                <p>Take a short (3 min) symptom assessment. The information you give is safe and won’t be shared. Your
                    results will include:</p>
                <ul>
                    <li>Possible causes of symptoms.</li>
                    <li>Recommendations on what to do next.</li>
                </ul>
                <p><strong>About this symptom checker</strong></p>
                <ul>
                    <li>Created and validated by doctors</li>
                    <li>Clinically validated with patient cases</li>
                    <li>Class I medical device in EU</li>
                </ul>
                <p><strong>Before using the checkup, please read the Terms of Service and remember:</strong></p>
                <ul>
                    <li>Checkup isn’t a diagnosis. It’s only for your information and not a qualified medical
                        opinion.</li>
                    <li>Checkup isn’t for emergencies. Call your local emergency number right away when there’s a
                        health emergency.</li>
                    <li>Your data is safe. The information you give won’t be shared or used to identify you.</li>
                </ul>
                <p><input type="checkbox" id="termsCheckbox" name="question1" value="answer1"> <strong>I read and accept Terms of Service.</strong></p>
                <p><input type="checkbox" id="privacyCheckbox" name="question1" value="answer1"> <strong>I agree for my health information to be used for
                        the interview. More information in the Privacy Policy.</strong></p>
            </div>
        </div>

        <!-- Deuxième question -->
       <!-- Deuxième question -->
<!-- Deuxième question -->
<div class="question-container" style="display: none;">
    <div class="question">
        <p><strong>Are you male or female?</strong></p>
        <div class="options">
            <label>
                <input type="radio" name="gender" value="male"> Male
            </label>
            <label>
                <input type="radio" name="gender" value="female"> Female
            </label>
        </div>
    </div>
</div>


        <!-- Troisième question -->
       <div class="question-container" style="display: none;">
    <div class="question">
        <p><strong>How old are you?</strong></p>
        <p>Choose your age using the slider below.</p>
        <input type="range" id="ageRange" min="18" max="100" step="1" value="18" oninput="updateAgeText(this.value)" name="age">
        <p id="selectedAge">Selected Age: 18 years</p>
    </div>
</div>

    <!-- Quatrième question -->
<div class="question-container" style="display: none;">
    <div class="question">
        <p><strong>Please check all the statements below that apply to you:</strong></p>

        <!-- Première affirmation -->
        <div class="options">
            <label>
                <input type="checkbox" name="diabetes" value="yes"> I have diabetes
            </label>
            <label>
                <input type="checkbox" name="diabetes" value="no"> No
            </label>
            <label>
                <input type="checkbox" name="diabetes" value="unknown"> Don’t know
            </label>
        </div>

        <!-- Deuxième affirmation -->
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> I’m overweight or obese
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
            <label>
                <input type="checkbox" name="overweight" value="unknown"> Don’t know
            </label>
        </div>

        <!-- Troisième affirmation -->
        <div class="options">
            <label>
                <input type="checkbox" name="hypertension" value="yes"> I have hypertension
            </label>
            <label>
                <input type="checkbox" name="hypertension" value="no"> No
            </label>
            <label>
                <input type="checkbox" name="hypertension" value="unknown"> Don’t know
            </label>
        </div>

        <!-- Quatrième affirmation -->
        <div class="options">
            <label>
                <input type="checkbox" name="smoking" value="yes"> I have smoked cigarettes for at least 10 years
            </label>
            <label>
                <input type="checkbox" name="smoking" value="no"> No
            </label>
            <label>
                <input type="checkbox" name="smoking" value="unknown"> Don’t know
            </label>
        </div>

        <!-- Cinquième affirmation -->
        <div class="options">
            <label>
                <input type="checkbox" name="injury" value="yes"> I’ve recently suffered an injury
            </label>
            <label>
                <input type="checkbox" name="injury" value="no"> No
            </label>
            <label>
                <input type="checkbox" name="injury" value="unknown"> Don’t know
            </label>
        </div>

        <!-- Sixième affirmation -->
        <div class="options">
            <label>
                <input type="checkbox" name="cholesterol" value="yes"> I have high cholesterol
            </label>
            <label>
                <input type="checkbox" name="cholesterol" value="no"> No
            </label>
            <label>
                <input type="checkbox" name="cholesterol" value="unknown"> Don’t know
            </label>
        </div>
    </div>
</div>
<!-- septeme affirmation -->
    <div class="question-container" style="display: none;">
    <div class="question">
        <p><strong>Do you experience any of the following symptoms?</strong></p>
        <div class="options">
            <label>
                <input type="checkbox" name="symptom" value="pain"> Pain
            </label>
            <label>
                <input type="checkbox" name="symptom" value="fatigue"> Fatigue
            </label>
            <label>
                <input type="checkbox" name="symptom" value="nausea"> Nausea
            </label>
            <label>
                <input type="checkbox" name="symptom" value="fever"> Fever
            </label>
            <!-- Add more symptoms as needed -->
        </div>
    </div>
</div>
<!-- Second question about symptoms related to cancer -->
<div class="question-container" style="display: none;">
    <div class="question">
        <p><strong>Are you experiencing any of the following symptoms associated with cancer?</strong></p>
        <div class="options">
            <label>
                <input type="checkbox" name="cancer_symptom" value="persistent_cough"> Persistent cough
            </label>
            <label>
                <input type="checkbox" name="cancer_symptom" value="unexplained_weight_loss"> Unexplained weight loss
            </label>
            <label>
                <input type="checkbox" name="cancer_symptom" value="fatigue"> Fatigue
            </label>
            <label>
                <input type="checkbox" name="cancer_symptom" value="blood_in_stool"> Blood in stool
            </label>
            <!-- Add more symptoms associated with cancer -->
        </div>
    </div>
</div>
<!-- Cinquième question -->
<div class="question-container" style="display: none;">
    <div class="question">
        <p><strong>On a scale from 0 to 10, with 0 being no pain and 10 being the worst pain imaginable, how would you rate your pain on an average day?</strong></p>
        <div class="pain-severity-container">
            <input type="range" id="painSeverity" min="0" max="10" step="1" name="painSeverity">
            <output for="painSeverity" id="severityValue">No Pain</output>
        </div>
    </div>
</div>
<!-- Sixième question -->
<div class="question-container" style="display: none;">
    <div class="question">
        <p><strong>How often do you experience pain? Daily, weekly, monthly, occasionally?</strong></p>
        <div class="options">
            <label>
                <input type="radio" name="painFrequency" value="daily"> Daily
            </label>
            <label>
                <input type="radio" name="painFrequency" value="weekly"> Weekly
            </label>
            <label>
                <input type="radio" name="painFrequency" value="monthly"> Monthly
            </label>
            <label>
                <input type="radio" name="painFrequency" value="occasionally"> Occasionally
            </label>
        </div>
    </div>
</div>
<!-- Septième question -->
<!-- Septième question -->
<div class="question-container" style="display: none;">
    <div class="question">
        <p><strong>How long does each episode of pain typically last?</strong></p>
        <div class="options">
            <select id="painDuration" name="painDuration" style="width: 50%; padding: 10px; font-size: 16px;">
                <option value="short">Short (minutes)</option>
                <option value="medium">Medium (hours)</option>
                <option value="long">Long (days)</option>
            </select>
        </div>
    </div>
</div>

<!-- Huitième question -->
<!-- Huitième question -->
<!-- Huitième question -->
<!-- Huitième question -->
<div class="question-container" style="display: none;">
    <div class="question">
        <p><strong>Are there specific triggers or patterns associated with your pain? (e.g., certain activities, time of day)</strong></p>
        <div style="margin-top: 20px;">
            <label for="painTriggers" style="font-weight: bold; font-size: 18px;">Select or suggest:</label>
            <div style="display: flex; align-items: center; margin-top: 10px;">
                <select id="painTriggers" name="painTriggers" style="padding: 15px; font-size: 16px; border: 2px solid #3498db; border-radius: 5px;">
                    <option value="" disabled selected>Select or suggest</option>
                    <option value="certain_activities">Certain Activities</option>
                    <option value="time_of_day">Time of Day</option>
                    <option value="weather_changes">Weather Changes</option>
                    <option value="emotional_stress">Emotional Stress</option>
                    <option value="lack_of_sleep">Lack of Sleep</option>
                    <option value="food_and_drinks">Certain Foods or Drinks</option>
                    <option value="physical_exertion">Physical Exertion</option>
                    <option value="medication">Medication</option>
                    <option value="environmental_factors">Environmental Factors</option>
                    <option value="hormonal_changes">Hormonal Changes</option>
                    <!-- Add more options as needed -->
                </select>
            </div>
        </div>
        <div style="margin-top: 20px;">
            <p style="font-size: 16px;">Describe any additional details or patterns related to your pain:</p>
            <textarea id="additionalDetails" name="additionalDetails" rows="4" style="width: 80%; padding: 10px; font-size: 16px; border: 2px solid #3498db; border-radius: 5px;"></textarea>
        </div>
    </div>
</div>

  <div class="question-container">
    <div class="question">
        <p><strong>Select symptoms that apply to you:</strong></p>
        <div style="margin-top: 20px;">
            <label style="font-weight: bold; font-size: 18px;">Symptoms:</label>
            <div style="display: flex; flex-wrap: wrap; margin-top: 10px;">

                <!-- First Row -->
                <div style="flex-basis: 25%; padding: 5px;">
                    <input type="checkbox" name="pelvicPain" value="true"> Pelvic Pain
                </div>
                <div style="flex-basis: 25%; padding: 5px;">
                    <input type="checkbox" name="fatigue" value="true"> Fatigue
                </div>
                <div style="flex-basis: 25%; padding: 5px;">
                    <input type="checkbox" name="painfulMenstruation" value="true"> Painful Menstruation
                </div>
                <div style="flex-basis: 25%; padding: 5px;">
                    <input type="checkbox" name="painDuringIntercourse" value="true"> Pain During Intercourse
                </div>
                <div style="flex-basis: 25%; padding: 5px;">
                    <input type="checkbox" name="abnormalBleeding" value="true"> Abnormal Bleeding
                </div>

                <!-- Second Row -->
                <div style="flex-basis: 25%; padding: 5px;">
                    <input type="checkbox" name="weightGain" value="true"> Weight Gain
                </div>
                <div style="flex-basis: 25%; padding: 5px;">
                    <input type="checkbox" name="acne" value="true"> Acne
                </div>
                <div style="flex-basis: 25%; padding: 5px;">
                    <input type="checkbox" name="hirsutism" value="true"> Hirsutism
                </div>
                <div style="flex-basis: 25%; padding: 5px;">
                    <input type="checkbox" name="irregularOvulation" value="true"> Irregular Ovulation
                </div>

                <div style="flex-basis: 25%; padding: 5px;">
    			<input type="checkbox" name="hotFlashes" value="true"> Hot Flashes
				</div>
				<div style="flex-basis: 25%; padding: 5px;">
   			    <input type="checkbox" name="vaginalDryness" value="true"> Vaginal Dryness
				</div>
				<div style="flex-basis: 25%; padding: 5px;">
    			<input type="checkbox" name="moodSwings" value="true"> Mood Swings
				</div>
				<div style="flex-basis: 25%; padding: 5px;">
    			<input type="checkbox" name="backPain" value="true"> Back Pain
				</div>

<!-- Continue the pattern for additional rows -->

<!-- Fourth Row -->
				<div style="flex-basis: 25%; padding: 5px;">
    			<input type="checkbox" name="frequentUrination" value="true"> Frequent Urination
				</div>
				<div style="flex-basis: 25%; padding: 5px;">
    			<input type="checkbox" name="bloating" value="true"> Bloating
				</div>
				<div style="flex-basis: 25%; padding: 5px;">
    			<input type="checkbox" name="vaginalDischarge" value="true"> Vaginal Discharge
				</div>
				<div style="flex-basis: 25%; padding: 5px;">
    			<input type="checkbox" name="irregularMenstruation" value="true"> Irregular Menstruation
				</div>

<!-- Continue the pattern for additional rows -->

<!-- Fifth Row -->
		<div style="flex-basis: 25%; padding: 5px;">
    	<input type="checkbox" name="itching" value="true"> Itching
		</div>
		<div style="flex-basis: 25%; padding: 5px;">
    	<input type="checkbox" name="burningDuringUrination" value="true"> Burning During Urination
		</div>
		<div style="flex-basis: 25%; padding: 5px;">
    	<input type="checkbox" name="vaginalItching" value="true"> Vaginal Itching
		</div>
		<div style="flex-basis: 25%; padding: 5px;">
    	<input type="checkbox" name="thickWhiteDischarge" value="true"> Thick White Discharge
		</div>

<!-- Continue the pattern for additional rows -->

<!-- Sixth Row -->
			<div style="flex-basis: 25%; padding: 5px;">
    		<input type="checkbox" name="heavyMenstrualBleeding" value="true"> Heavy Menstrual Bleeding
			</div>
			<div style="flex-basis: 25%; padding: 5px;">
    		<input type="checkbox" name="abnormalVaginalDischarge" value="true"> Abnormal Vaginal Discharge
			</div>
			<div style="flex-basis: 25%; padding: 5px;">
    		<input type="checkbox" name="painfulUrination" value="true"> Painful Urination
			</div>
			<div style="flex-basis: 25%; padding: 5px;">
    			<input type="checkbox" name="abnormalVaginalBleeding" value="true"> Abnormal Vaginal Bleeding
			</div>
            </div>
        </div>
    </div>
</div>


<!-- Neuvième question -->
<div class="question-container" style="display: none;">
    <div class="question">
        <p><strong>How does pain affect your daily activities and quality of life?</strong></p>
        <div style="margin-top: 20px;">
            <p style="font-size: 16px;">Select the option that best describes how pain affects you:</p>
            <div style="display: flex; flex-wrap: wrap; gap: 10px; margin-top: 10px;">
                <label style="flex: 1;">
                    <input type="radio" name="painImpact" value="not_at_all"> Not at all
                </label>
                <label style="flex: 1;">
                    <input type="radio" name="painImpact" value="slightly"> Slightly
                </label>
                <label style="flex: 1;">
                    <input type="radio" name="painImpact" value="moderately"> Moderately
                </label>
                <label style="flex: 1;">
                    <input type="radio" name="painImpact" value="severely"> Severely
                </label>
                <!-- Add more options as needed -->
            </div>
        </div>
       
    </div>
</div>
<div class="question-container" style="display: none;">
    <!-- Pregnancy Status -->
    <div class="question" style="display: inline-block; margin-right: 20px;">
        <p><strong>Are you pregnant?</strong></p>
        <div class="options">
            <label>
                <input type="radio" name="pregnancy_status" value="Pregnant"> Yes
            </label>
            <label>
                <input type="radio" name="pregnancy_status" value="Not Pregnant"> No
            </label>
        </div>
    </div>
    </div>
<div class="question-container" style="display: none;">
    <!-- Menstrual Irregularities -->
    <div class="question" style="display: inline-block;">
        <p><strong>Do you have menstrual irregularities?</strong></p>
        <div class="options">
            <label>
                <input type="radio" name="menstrual_irregularities" value="true"> Yes
            </label>
            <label>
                <input type="radio" name="menstrual_irregularities" value="false"> No
            </label>
        </div>
    </div>
</div>

<div class="question-container" style="display: none;">
    <div class="question">
        <p><strong>Please check all the statements below that apply to you:</strong></p>

        <!-- Première affirmation -->
        <div class="options">
            <label>
                <input type="checkbox" name="diabetes" value="yes"> Breast pain
            </label>
            <label>
                <input type="checkbox" name="diabetes" value="no"> No
            </label>
           
        </div>

        <!-- Deuxième affirmation -->
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Abnormal bleeding
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> family history
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Diarrhea
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Blood pressure
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Thyroid disorder
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Rectal Pain
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Heart disease
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes">  Reproductive issues
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Pelvic pain
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Vaginal discharge
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Vaginal bleeding
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Vaginal dryness
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Nipple discharge
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Heat itolerance
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        </div></div>
        <div class="question-container"style="display: none;">
        <p><strong> Palpitations</strong></p>
        <div class="options">
            <label>
                <input type="radio" name="mood_swings" value="true"> Yes
            </label>
            <label>
                <input type="radio" name="mood_swings" value="false"> No
            </label>
        </div>
    </div>  <div class="question-container"style="display: none;">
        <p><strong> Irritability</strong></p>
        <div class="options">
            <label>
                <input type="radio" name="mood_swings" value="true"> Yes
            </label>
            <label>
                <input type="radio" name="mood_swings" value="false"> No
            </label>
        </div>
    </div>
    <div class="question-container"style="display: none;">
        <p><strong> Widespread_Pain</strong></p>
        <div class="options">
            <label>
                <input type="radio" name="mood_swings" value="true"> Yes
            </label>
            <label>
                <input type="radio" name="mood_swings" value="false"> No
            </label>
        </div>
    </div>
    <div class="question-container"style="display: none;">
        <p><strong> Muscle_Pain</strong></p>
        <div class="options">
            <label>
                <input type="radio" name="mood_swings" value="true"> Yes
            </label>
            <label>
                <input type="radio" name="mood_swings" value="false"> No
            </label>
        </div>
    </div>
     <div class="question-container"style="display: none;">
        <p><strong> Difficulty_Concentrating</strong></p>
        <div class="options">
            <label>
                <input type="radio" name="mood_swings" value="true"> Yes
            </label>
            <label>
                <input type="radio" name="mood_swings" value="false"> No
            </label>
        </div>
    </div>
    
     
<div class="question-container" style="display: none;">
    <div class="question">
        <p><strong>On a scale of 0% (no impact) to 100% (maximum impact), how does pain affect your daily activities and quality of life?</strong></p>
        <div class="percentage-slider-container">
            <input type="range" id="painImpact" name="painImpactPercentage" min="0" max="100" step="1" value="0" oninput="updateImpactText(this.value)">
            <div class="percentage-value" id="selectedImpact">0%</div>
        </div>
    </div>
</div><div class="question-container" style="display: none;">
    <div class="question">
        <p><strong>Please check all the statements below that apply to you:</strong></p>

        <!-- Première affirmation -->
        <div class="options">
            <label>
                <input type="checkbox" name="diabetes" value="yes"> Cervicitis
            </label>
            <label>
                <input type="checkbox" name="diabetes" value="no"> No
            </label>
           
        </div>

        <!-- Deuxième affirmation -->
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Vulvodynia
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Ectopic Pregnancy
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Irregular Ovulation
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Anemia
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Thyroid disorder
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Sleep disturbances
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Allergies
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Chronic pelvic pain
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Dysmenorrhea
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Dizziness
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Vaginal bleeding
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes">Chest pain
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Shortness of breath
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        <div class="options">
            <label>
                <input type="checkbox" name="overweight" value="yes"> Hair loss
            </label>
            <label>
                <input type="checkbox" name="overweight" value="no"> No
            </label>
           
        </div>
        </div></div>


    <div id="navigation-bar">
        <button class="navigation-button" onclick="prevQuestion()">Back</button>
        <button class="navigation-button" type="button" onclick="nextQuestion()">Next</button>

 <button class="navigation-button" type="button" onclick="submitQuiz()">validate</button>

    </div>
    
</form>
   <script>
    
    function validateQuiz() {
        // Récupérez toutes les questions du formulaire
        var questions = document.querySelectorAll('.question-container');

        // Parcourez chaque question
        for (var i = 0; i < questions.length; i++) {
            var question = questions[i];
            
            // Vérifiez si la question est visible (display: block)
            if (question.style.display === 'block') {
                // Vérifiez si au moins une option est sélectionnée
                var selectedOptions = question.querySelectorAll('input:checked');
                if (selectedOptions.length === 0) {
                    // Affichez un message d'erreur ou faites ce que vous voulez
                    alert('Veuillez répondre à toutes les questions avant de passer à la suivante.');
                    return false; // Le formulaire n'est pas valide
                }
            }
        }

        // Si toutes les questions sont valides, vous pouvez également appeler submitQuiz() ici
        submitQuiz();

        return true; // Le formulaire est valide
    }

    function submitQuiz() {
        // Ajoutez ici la logique pour soumettre le formulaire (envoyer les données au serveur)
        document.getElementById('quizForm').submit(); // Cela soumet le formulaire
    }


        function toggleLanguageDropdown() {
            var langOptions = document.getElementById('langOptions');
            langOptions.style.display = (langOptions.style.display === 'block') ? 'none' : 'block';
        }

        function changeLanguage(language) {
            // Implement language switching logic here
            alert('Language switched to ' + language + '!');
            // You can modify this function to actually change the language on the
        }

        var currentQuestionIndex = 0;

        function displayQuestion() {
            var questionContainers = document.querySelectorAll('.question-container');
            questionContainers.forEach(function (container, index) {
                container.style.display = (index === currentQuestionIndex) ? 'block' : 'none';
            });
        }

        function nextQuestion() {
            // Appeler la fonction pour valider les cases à cocher
            if (validateAndProceed()) {
                // Passer à la question suivante
                if (currentQuestionIndex < document.querySelectorAll('.question-container').length - 1) {
                    currentQuestionIndex++;
                    displayQuestion();
                } else {
                    alert("last question !");
                }
            }
        }
        function validateAndProceed() {
            // Vérifier si les cases à cocher sont cochées
            var termsCheckbox = document.getElementById("termsCheckbox");
            var privacyCheckbox = document.getElementById("privacyCheckbox");

            if (termsCheckbox.checked && privacyCheckbox.checked) {
                // Si les deux cases sont cochées, retourner true pour permettre de passer à la question suivante
                return true;
            } else {
                // Sinon, afficher un message d'alerte et retourner false
                alert("Veuillez cocher les deux cases avant de passer à la question suivante.");
                return false;
            }
        }

        function prevQuestion() {
            if (currentQuestionIndex > 0) {
                currentQuestionIndex--;
                displayQuestion();
            } else {
                alert("C'est la première question !");
            }
        }

        function selectGender(gender) {
            alert('Selected gender: ' + gender);
            // You can perform additional logic here based on the selected gender
            // For now, just display an alert
        }

        window.onload = function () {
            displayQuestion();
        };

        function updateAgeText(value) {
            var selectedAge = document.getElementById('selectedAge');
            selectedAge.innerHTML = 'Âge sélectionné : ' + value + ' ans';
        }
        function updateImpactText(value) {
            var selectedImpact = document.getElementById('selectedImpact');
            selectedImpact.innerHTML = value + '%';
        }
     // JavaScript to display the current value of the range input
        const painSeverity = document.getElementById('painSeverity');
        const severityValue = document.getElementById('severityValue');

        painSeverity.addEventListener('input', () => {
            severityValue.innerText = getPainLabel(painSeverity.value);
        });

        function getPainLabel(value) {
            switch (parseInt(value)) {
                case 0:
                    return 'No Pain';
                case 10:
                    return 'Worst Pain';
                default:
                    return value;
            }
        }
        
    </script>
    
<!-- À ajouter dans votre fichier quiz.jsp -->


</body>

</html>