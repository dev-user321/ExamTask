using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using static System.Collections.Specialized.BitVector32;

namespace SdfTask.Helper
{
    public static class Helper
    {
       
            public static void IncreaseSessionTime()
            {
                if (HttpContext.Current.Session["Email"] != null)
                {
                    DateTime lastActivityTime = DateTime.Now;

                    if (HttpContext.Current.Session["LastActivity"] != null)
                    {
                        lastActivityTime = (DateTime)HttpContext.Current.Session["LastActivity"];

                        if (DateTime.Now.Subtract(lastActivityTime).TotalSeconds > 30)
                        {
                            HttpContext.Current.Session.Clear();
                            HttpContext.Current.Response.Redirect("Login.aspx");
                            return;
                        }
                    }

                    HttpContext.Current.Session["LastActivity"] = DateTime.Now;
                }
                else
                {
                    HttpContext.Current.Response.Redirect("Login.aspx");
                }
            }
        }

    }

