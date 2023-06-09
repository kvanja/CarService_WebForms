﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRegistration {
    public partial class SiteMaster : MasterPage {
        protected void Page_Load(object sender, EventArgs e) {
            if (Context.Request.Cookies["CarOwnerData"] == null) {
                LogOffBtn.Enabled = false;
            }
        }

        protected void LogOffBtn_Click(object sender, EventArgs e) {
            if (IsPostBack && Request.Cookies["CarOwnerData"] != null) {
                Response.Cookies["CarOwnerData"].Expires = DateTime.Now.AddDays(-1);
                Response.Redirect("https://localhost:44358/Login");
            }
            else {
                return;
            }
        }
    }
}