package com.jms.respect.service;

import com.jms.respect.dto.CompletedForm;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Date;

/**
 * Created by anon on 12/03/2016.
 */
@Service
public class HistoricalImporterService {
    private static final int FIRST_DATA_ROW_NUM = 1;
    private static final int LAST_DATA_ROW_NUM = 566;
    private static final int SUBMISSION_TIMESTAMP_COL_NUM = 1;
    private static final int LEAGUE_COL_NUM = 2;
    private static final int COMPETITION_COL_NUM = 3;
    private static final int REFEREE_COL_NUM = 4;
    private static final int HOME_TEAM_COL_NUM = 5;
    private static final int AWAY_TEAM_COL_NUM = 6;
    private static final int MATCH_DATE_COL_NUM = 7;
    private static final int CHANGING_FACILITY_SCORE_COL_NUM = 8;
    private static final int CHANGING_FACILITY_COMMENT_COL_NUM = 9;
    private static final int LATE_KICKOFF_COL_NUM = 10;
    private static final int HOW_LATE_COL_NUM = 11;
    private static final int LATE_FAULT_COL_NUM = 12;
    private static final int BALLS_PROVIDED_COL_NUM = 13;
    private static final int SHIRTS_COL_NUM = 14;
    private static final int SPECTATOR_HOME_SCORE_COL_NUM = 15;
    private static final int SPECTATOR_AWAY_SCORE_COL_NUM = 16;
    private static final int SPECTATOR_COMMENT_COL_NUM = 17;
    private static final int ASSISTANT_HOME_SCORE_COL_NUM = 18;
    private static final int ASSISTANT_AWAY_SCORE_COL_NUM = 19;
    private static final int ASSISTANT_COMMENT_COL_NUM = 20;
    private static final int CAPT_LIAISON_HOME_SCORE_COL_NUM = 21;
    private static final int CAPT_LIAISON_AWAY_SCORE_COL_NUM = 22;
    private static final int CAPT_LIAISON_COMMENT_COL_NUM = 23;
    private static final int HOSPITALITY_COL_NUM = 24;
    private static final int TEAM_SHEET_COL_NUM = 25;
    private static final int CONTACT_COL_NUM = 26;
    private static final int CAPT_ARMBANDS_COL_NUM = 27;
    private static final int OVERALL_HOME_SCORE_COL_NUM = 28;
    private static final int OVERALL_AWAY_SCORE_COL_NUM = 29;
    private static final int OVERALL_COMMENT_COL_NUM = 30;

    private final FormService formService;

    @Autowired
    public HistoricalImporterService(FormService formService) {
        this.formService = formService;
    }

    public void readFile() {
        int r = 0;

        try {
            File file = new File("C:/Users/anon/git/all_awp/respect/db/Huddersfield & District Football Association Referee Report Form (Responses).xlsx");
            XSSFWorkbook wb = new XSSFWorkbook(new FileInputStream(file));
            XSSFSheet sheet = wb.getSheetAt(0);
            XSSFRow row;
            XSSFCell cell;

            int rows; // No of rows
            rows = sheet.getPhysicalNumberOfRows();

            int cols = 0; // No of columns
            int tmp = 0;

            // This trick ensures that we get the data properly even if it doesn't start from first few rows
            for(int i = 0; i < 10 || i < rows; i++) {
                row = sheet.getRow(i);
                if(row != null) {
                    tmp = sheet.getRow(i).getPhysicalNumberOfCells();
                    if(tmp > cols) {
                        cols = tmp;
                    }
                }
            }

            for(r = FIRST_DATA_ROW_NUM; r <= LAST_DATA_ROW_NUM; r++) {
                row = sheet.getRow(r);
                if(row != null) {
                    CompletedForm completedForm = new CompletedForm();
                    cell = row.getCell(SUBMISSION_TIMESTAMP_COL_NUM);
                    Date submissionDate = new Date(cell.getDateCellValue().getTime());
                    completedForm.setDateFormSubmitted(submissionDate);

                    cell = row.getCell(LEAGUE_COL_NUM);
                    String league = cell.getStringCellValue();
                    completedForm.setLeague(league);

                    cell = row.getCell(COMPETITION_COL_NUM);
                    String competition = cell.getStringCellValue();
                    completedForm.setCompetition(competition);

                    cell = row.getCell(REFEREE_COL_NUM);
                    String referee = cell.getStringCellValue();
                    completedForm.setReferee(referee);

                    cell = row.getCell(HOME_TEAM_COL_NUM);
                    String homeTeam = cell.getStringCellValue();
                    completedForm.setHomeTeam(homeTeam);

                    cell = row.getCell(AWAY_TEAM_COL_NUM);
                    String awayTeam = cell.getStringCellValue();
                    completedForm.setAwayTeam(awayTeam);

                    cell = row.getCell(MATCH_DATE_COL_NUM);
                    Date matchDate = new Date(cell.getDateCellValue().getTime());
                    completedForm.setMatchDate(matchDate);


                    cell = row.getCell(CHANGING_FACILITY_SCORE_COL_NUM);
                    Short changingFacilitiesScore = (short) cell.getNumericCellValue();
                    completedForm.setChangingFacilityScore(changingFacilitiesScore);

                    cell = row.getCell(CHANGING_FACILITY_COMMENT_COL_NUM);
                    String changingFacilityComment = null;
                    if(cell != null) {
                        changingFacilityComment = cell.getStringCellValue();
                    }
                    completedForm.setChangingFacilityComment(changingFacilityComment);

                    cell = row.getCell(LATE_KICKOFF_COL_NUM);
                    String lateKickOff = cell.getStringCellValue();
                    completedForm.setKickOffLate(lateKickOff);

                    cell = row.getCell(HOW_LATE_COL_NUM);
                    String howLate = null;
                    if(cell != null) {
                        cell.setCellType(Cell.CELL_TYPE_STRING);
                        howLate = cell.getStringCellValue();
                    }
                    completedForm.setKickOffHowLate(howLate);

                    cell = row.getCell(LATE_FAULT_COL_NUM);
                    String lateFault = null;
                    if(cell != null) {
                        lateFault = cell.getStringCellValue();
                    }
                    completedForm.setKickOffFault(lateFault);

                    cell = row.getCell(BALLS_PROVIDED_COL_NUM);
                    String balls = cell.getStringCellValue();
                    completedForm.setBall(balls);

                    cell = row.getCell(SHIRTS_COL_NUM);
                    String shirts = cell.getStringCellValue();
                    completedForm.setShirt(shirts);

                    cell = row.getCell(SPECTATOR_HOME_SCORE_COL_NUM);
                    Short spectatorsHomeScore = (short) cell.getNumericCellValue();
                    completedForm.setSpectatorHome(spectatorsHomeScore);

                    cell = row.getCell(SPECTATOR_AWAY_SCORE_COL_NUM);
                    Short spectatorsAwayScore = (short) cell.getNumericCellValue();
                    completedForm.setSpectatorAway(spectatorsAwayScore);

                    cell = row.getCell(SPECTATOR_COMMENT_COL_NUM);
                    String spectatorsComment = null;
                    if(cell != null) {
                        spectatorsComment = cell.getStringCellValue();
                    }
                    completedForm.setSpectatorComment(spectatorsComment);

                    cell = row.getCell(ASSISTANT_HOME_SCORE_COL_NUM);
                    Short assistantHomeScore = (short) cell.getNumericCellValue();
                    completedForm.setAssistantHome(assistantHomeScore);

                    cell = row.getCell(ASSISTANT_AWAY_SCORE_COL_NUM);
                    Short assistantAwayScore = (short) cell.getNumericCellValue();
                    completedForm.setAssistantAway(assistantAwayScore);

                    cell = row.getCell(ASSISTANT_COMMENT_COL_NUM);
                    String assistantComment = null;
                    if(cell != null) {
                        assistantComment = cell.getStringCellValue();
                    }
                    completedForm.setAssistantComment(assistantComment);

                    cell = row.getCell(CAPT_LIAISON_HOME_SCORE_COL_NUM);
                    Short captainLiaisonHomeScore = (short) cell.getNumericCellValue();
                    completedForm.setCaptainLiaisonHome(captainLiaisonHomeScore);

                    cell = row.getCell(CAPT_LIAISON_AWAY_SCORE_COL_NUM);
                    Short captainLiaisonAwayScore = (short) cell.getNumericCellValue();
                    completedForm.setCaptainLiaisonAway(captainLiaisonAwayScore);

                    cell = row.getCell(CAPT_LIAISON_COMMENT_COL_NUM);
                    String captainLiaisonComment = null;
                    if(cell != null) {
                        captainLiaisonComment = cell.getStringCellValue();
                    }
                    completedForm.setCaptainLiaisonComment(captainLiaisonComment);

                    cell = row.getCell(HOSPITALITY_COL_NUM);
                    Short homeHospitalityScore = (short) cell.getNumericCellValue();
                    completedForm.setHospitality(homeHospitalityScore);

                    cell = row.getCell(TEAM_SHEET_COL_NUM);
                    String teamSheets = cell.getStringCellValue();
                    completedForm.setTeamSheet(teamSheets);

                    cell = row.getCell(CONTACT_COL_NUM);
                    String contact = cell.getStringCellValue();
                    completedForm.setContact(contact);

                    cell = row.getCell(CAPT_ARMBANDS_COL_NUM);
                    String captainArmbands = cell.getStringCellValue();
                    completedForm.setCaptainArmband(captainArmbands);

                    cell = row.getCell(OVERALL_HOME_SCORE_COL_NUM);
                    Short overallHomeScore = (short) cell.getNumericCellValue();
                    completedForm.setOverallScoreHome(overallHomeScore);

                    cell = row.getCell(OVERALL_AWAY_SCORE_COL_NUM);
                    Short overallAwayScore = (short) cell.getNumericCellValue();
                    completedForm.setOverallScoreAway(overallAwayScore);

                    cell = row.getCell(OVERALL_COMMENT_COL_NUM);
                    String overallComment = null;
                    if(cell != null) {
                        overallComment = cell.getStringCellValue();
                    }
                    completedForm.setOverallScoreComment(overallComment);

                    formService.submitForm(completedForm);
                }
            }
        } catch(Exception ioe) {
            ioe.printStackTrace();

            System.out.println("Failed on row: " + r);
        }
    }
}
