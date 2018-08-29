﻿<%@ WebHandler Language="C#" Class="Handler" %>

using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;
using System.Web;
using System.Collections.Generic;
public class Handler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        string result = "";
        string  kind =  context.Request["kind"];
        if (kind == "contactus")
        {
            ContactUs.ItemData itemData = new ContactUs.ItemData();
            itemData.Email = context.Request["email"];
            itemData.Contents = context.Request["Contents"];
            itemData.Phone = context.Request["Phone"];
            itemData.Usermame = context.Request["username"];

            itemData.Secno = 0;
            itemData.Status = "Y";
            result = ContactUs.Add(itemData);
            context.Response.Write(result);
        }
        if (kind == "joinlesson")
        {
            LessonLib.JoinData itemData = new LessonLib.JoinData();
                
            itemData.Email = context.Request["email"];
            itemData.LessonId  = context.Request["LessonId"];
            itemData.Phone = context.Request["Phone"];
            itemData.Usermame  = context.Request["username"];          
            itemData.Status = "Y";
            result = LessonLib.DbHandle.JoinAdd (itemData);
            context.Response.Write(result);
           
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}