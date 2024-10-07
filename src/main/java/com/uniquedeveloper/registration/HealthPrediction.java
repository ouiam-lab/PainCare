package com.uniquedeveloper.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;




@WebServlet("/healthAnalyzer")
public class HealthPrediction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // symptoms
    	String pelvicPain = request.getParameter("pelvicPain");
        String painfulMenstruation = request.getParameter("painfulMenstruation");
        String fatigue = request.getParameter("fatigue");
        String painDuringIntercourse = request.getParameter("painDuringIntercourse");
        String irregularMenstruation = request.getParameter("irregularMenstruation");
        String abnormalBleeding = request.getParameter("abnormalBleeding");
        String weightGain = request.getParameter("weightGain");
        String acne = request.getParameter("acne");
        String hirsutism = request.getParameter("hirsutism");
        String irregularOvulation = request.getParameter("irregularOvulation");
        String hotFlashes = request.getParameter("hotFlashes");
        String vaginalDryness = request.getParameter("vaginalDryness");
        String moodSwings = request.getParameter("moodSwings");
        String backPain = request.getParameter("backPain");
        String frequentUrination = request.getParameter("frequentUrination");
        String bloating = request.getParameter("bloating");
        String vaginalDischarge = request.getParameter("vaginalDischarge");
        String itching = request.getParameter("itching");
        String burningDuringUrination = request.getParameter("burningDuringUrination");
        String vaginalItching = request.getParameter("vaginalItching");
        String thickWhiteDischarge = request.getParameter("thickWhiteDischarge");
        String heavyMenstrualBleeding = request.getParameter("heavyMenstrualBleeding");
        String abnormalVaginalDischarge = request.getParameter("abnormalVaginalDischarge");
        String painfulUrination = request.getParameter("painfulUrination");
        String abnormalVaginalBleeding = request.getParameter("abnormalVaginalBleeding");

        // Perform prediction for Endometriosis
        String endometriosisPrediction = HealthAnalyzer.predictEndometriosisWithRisk(pelvicPain, painfulMenstruation, fatigue, painDuringIntercourse);
        String pcosPrediction = HealthAnalyzer.predictPCOS(irregularMenstruation, abnormalBleeding, weightGain, acne, hirsutism);
        String prematureOvarianFailurePrediction = HealthAnalyzer.predictPrematureOvarianFailure(irregularOvulation, irregularMenstruation, hotFlashes, vaginalDryness, moodSwings);
        String uterineFibroidsPrediction = HealthAnalyzer.predictUterineFibroids(pelvicPain, heavyMenstrualBleeding, backPain, frequentUrination);
        String ovarianCystsPrediction = HealthAnalyzer.predictOvarianCysts(pelvicPain, bloating, irregularOvulation);
        String bacterialVaginosisPrediction = HealthAnalyzer.predictBacterialVaginosis(vaginalDischarge, itching, burningDuringUrination);
        String candidiasisPrediction = HealthAnalyzer.predictCandidiasis(vaginalItching, thickWhiteDischarge, painDuringIntercourse);
        String pidPrediction = HealthAnalyzer.predictPID(pelvicPain, abnormalVaginalDischarge, painfulUrination);
        String uterineCancerPrediction = HealthAnalyzer.predictUterineCancer(abnormalVaginalBleeding, pelvicPain, painDuringIntercourse);
        // Set the prediction result as a request attribute
        request.setAttribute("endometriosisPrediction", endometriosisPrediction);
        request.setAttribute("pcosPrediction", pcosPrediction);
        request.setAttribute("prematureOvarianFailurePrediction", prematureOvarianFailurePrediction);
        request.setAttribute("uterineFibroidsPrediction", uterineFibroidsPrediction);
        request.setAttribute("ovarianCystsPrediction", ovarianCystsPrediction);
        request.setAttribute("bacterialVaginosisPrediction", bacterialVaginosisPrediction);
        request.setAttribute("candidiasisPrediction", candidiasisPrediction);
        request.setAttribute("pidPrediction", pidPrediction);
        request.setAttribute("uterineCancerPrediction", uterineCancerPrediction);
        
        forwardToPredictionResult(request, response);
    }

    // Add a helper method for forwarding to the prediction result JSP
    private void forwardToPredictionResult(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("predictionResult.jsp");
        dispatcher.forward(request, response);
    }
}