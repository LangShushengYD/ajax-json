package web;

import org.json.JSONArray;
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
public class GetAjaxServlet extends HttpServlet {

    private static final long serialVersionUID=1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
        this.doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        response.setContentType("text/html;charset=utf-8");
        String action = request.getParameter("action");
        if("checkUserName".equals(action)){
            this.checkUserName(request,response);
        }else if("ejld".equals(action)){
            this.ejld(request,response);
        }

    }

    private void checkUserName(HttpServletRequest request, HttpServletResponse response) throws IOException{
        PrintWriter out = response.getWriter();
        JSONObject resultJson=new JSONObject();
        String username=request.getParameter("userName");
        if("jack".equals(username)){
            resultJson.put("exist",true);
        }else {
            resultJson.put("exist",false);
        }
        out.println(resultJson);
        out.flush();
        out.close();
    }
    private void ejld(HttpServletRequest request, HttpServletResponse response) throws IOException{
        PrintWriter out = response.getWriter();

        String shengId=request.getParameter("shengId");
        JSONObject resultJson=new JSONObject();
        JSONArray jsonArray = new JSONArray();
        JSONObject temp = null;
        switch (Integer.parseInt(shengId)){
            case 1:{
//                jsonArray=null;
                temp=new JSONObject();
                temp.put("id",1);
                temp.put("text","南京");
                jsonArray.put(temp);

                temp=new JSONObject();
                temp.put("id",2);
                temp.put("text","南通");
                jsonArray.put(temp);

                temp=new JSONObject();
                temp.put("id",3);
                temp.put("text","泰兴");
                jsonArray.put(temp);
                break;
            }
            case 2:{
//                jsonArray=null;
                temp=new JSONObject();
                temp.put("id",4);
                temp.put("text","济南");
                jsonArray.put(temp);

                temp=new JSONObject();
                temp.put("id",5);
                temp.put("text","青岛");
                jsonArray.put(temp);

                temp=new JSONObject();
                temp.put("id",6);
                temp.put("text","烟台");
                jsonArray.put(temp);
                break;
            }
            case 3:{
//                jsonArray=null;
                temp=new JSONObject();
                temp.put("id",7);
                temp.put("text","杭州");
                jsonArray.put(temp);

                temp=new JSONObject();
                temp.put("id",8);
                temp.put("text","温州");
                jsonArray.put(temp);

                temp=new JSONObject();
                temp.put("id",9);
                temp.put("text","宁波");
                jsonArray.put(temp);
                break;
            }
        }
        resultJson.remove("rows");
        resultJson.put("rows",jsonArray);

        out.println(resultJson);
        out.flush();
        out.close();
    }
}
