/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Question;

/**
 *
 * @author quoct
 */
public class QuestionDAO extends DBContext {

//    Get a question by QuesionID
    public Question getQuestionById(int id) {
        String sql = "Select * From Question Where QuestionId = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Question question = new Question(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
                return question;
            }
        } catch (Exception e) {
        }
        return null;
    }

//    Get a list of question by CollectionDetailID
    public List<Question> getCollectionById(int id) {
        String sql = "Select * From Collection Join Question On Collection.QuestionID = Question.QuestionID Where CollectionDetailID = ?";
        List<Question> list = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Question question = new Question(rs.getInt("QuestionID"),
                        rs.getString("Detail"),
                        rs.getString("AnswerA"),
                        rs.getString("AnswerB"),
                        rs.getString("AnswerC"),
                        rs.getString("AnswerD"),
                        rs.getString("TrueAnswer"));
                list.add(question);
            }
        } catch (Exception e) {
        }
        return list;
    }

}
