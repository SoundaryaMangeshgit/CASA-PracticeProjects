using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.WebRequestMethods;
using File = System.IO.File;
using System.Management.Automation.Runspaces;
using System.Management.Automation;
using System.Collections.ObjectModel;
using System.Text;

namespace MASUploadAutomateScript
{
    public partial class MASUpload : System.Web.UI.Page
    {
        private string MASADPath
        {
            get
            {
                return this.tbArchiveDrivePath.Text;
            }
        }

        private string MASUserPath
        {
            get
            {
                return this.tbUserPath.Text;
            }
        }

        private string MASOutputFile
        {
            get
            {
                return this.tbOutputfile.Text;
            }
        }

        private string MASCommand
        {
            get
            {
                return this.tbRunScript.Text;
            }
        }

        
        protected void Page_Load(object sender, EventArgs e)
        {
				if (!Page.IsPostBack)
				{
				}
        }

        protected void Generate_DAT_File(object sender, EventArgs Exception)
        {
            FileUpload1.SaveAs(Server.MapPath("~/Uploads/" + FileUpload1.FileName));
            lblFileUpload.Text = "FileUploadedSuccessly";

            try {
                List<string> ReadFile = File.ReadAllLines(@"FilePath" + FileUpload1.FileName).ToList();
               
                StreamWriter sw = new StreamWriter("C:\\path\\"+ MASOutputFile + ".dat");
            foreach (string line in ReadFile)
            {
                String write1 = MASUserPath+"," + MASADPath + line;
                sw.WriteLine(write1);
            }
            sw.Close();
        }
            catch(Exception e )
            {
                Console.WriteLine("Exception"+ e.Message);
            }
            finally
            {
                lblWriteStatus.Text = "Output file written successly";
            }
        }

        protected void Run_Power_Command(object sender, EventArgs e)
        {
            tbDisplayScript.Text = RunCommand(MASCommand);
        }

        protected string RunCommand(String Command)
        {
           

            Runspace runspace = RunspaceFactory.CreateRunspace();

            // open it

            runspace.Open();

            // create a pipeline and feed it the script text

            Pipeline pipeline = runspace.CreatePipeline();
            pipeline.Commands.AddScript(Command);


            pipeline.Commands.Add("Out-String");

            // execute the script

            Collection<PSObject> results = pipeline.Invoke();

            // close the runspace

            runspace.Close();

            // convert the script result into a single string

            StringBuilder stringBuilder = new StringBuilder();
            foreach (PSObject obj in results)
            {
                stringBuilder.AppendLine(obj.ToString());
            }

            return stringBuilder.ToString();


        }
    }
}