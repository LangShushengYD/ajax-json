package web;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author:Cui
 * @date:2019/8/17
 * @type: class(类)
 * @description:
 * @action:
 */
public class GetAjaxInfoServlet extends HttpServlet {

    private static final long serialVersionUID=1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        response.setContentType("text/html;charset=utf-8");
        String action = request.getParameter("action");
        if("jsonObject".equals(action)){
            this.getJsonObject(request,response);
        }else if("jsonArray".equals(action)){
            this.getJsonArray(request,response);
        }

    }

    private void getJsonObject(HttpServletRequest request, HttpServletResponse response) throws IOException{
        PrintWriter out = response.getWriter();
        JSONObject resultJson=new JSONObject();
        try {
            resultJson.put("name","张三");
            resultJson.put("age",22);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        out.println(resultJson);
        out.flush();
        out.close();
    }
    private void getJsonArray(HttpServletRequest request, HttpServletResponse response) throws IOException{
        PrintWriter out = response.getWriter();

        JSONObject resultJson=new JSONObject();
        JSONArray jsonArray = new JSONArray();
        JSONObject jsonObject1 = new JSONObject();
        JSONObject jsonObject2 = new JSONObject();
        JSONObject jsonObject3 = new JSONObject();
        JSONObject scoreObject1 = new JSONObject();
        JSONObject scoreObject2 = new JSONObject();
        JSONObject scoreObject3 = new JSONObject();


        try {
            jsonObject1.put("name","张三");
            jsonObject1.put("age",22);
            scoreObject1.put("Chinese",90);
            scoreObject1.put("Math",80);
            scoreObject1.put("English",70);
            jsonObject1.put("score",scoreObject1);

            jsonObject2.put("name","李四");
            jsonObject2.put("age",23);
            scoreObject2.put("Chinese",60);
            scoreObject2.put("Math",79);
            scoreObject2.put("English",97);
            jsonObject2.put("score",scoreObject2);

            jsonObject3.put("name","王五");
            jsonObject3.put("age",24);
            scoreObject3.put("Chinese",79);
            scoreObject3.put("Math",89);
            scoreObject3.put("English",99);
            jsonObject3.put("score",scoreObject3);

            jsonArray.put(jsonObject1);
            jsonArray.put(jsonObject2);
            jsonArray.put(jsonObject3);
            resultJson.put("students",jsonArray);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        out.println(resultJson);
        out.flush();
        out.close();
    }
}
