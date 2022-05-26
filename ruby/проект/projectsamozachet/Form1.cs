using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace projectsamozachet
{
    public partial class Form1 : Form
    {
        Fasad fasad;
        MySqlConnection con;
        MySqlCommand command;
        public Form1()
        {
            InitializeComponent();

            this.fasad = new Fasad();
            this.con = new MySqlConnection("server=127.0.0.1;username=root;database=proect");
            podkl();
            
        }
        public Form1(Fasad fasad)
        {
            InitializeComponent();

            this.fasad = fasad;
            this.con = new MySqlConnection("server=127.0.0.1;username=root;database=proect");

        }

        private void job_Click(object sender, EventArgs e)
        {
            Jobs per_1 = new Jobs(fasad);
            per_1.Show();
            Hide();
        }

        private void work_Click(object sender, EventArgs e)
        {
            Works per_1 = new Works(fasad);
            per_1.Show();
            Hide();
        }

        private void worker_Click(object sender, EventArgs e)
        {
            Workers per_1 = new Workers(fasad);
            per_1.Show();
            Hide();
        }
        void podkl()
        {
            string zapros = "SELECT * FROM workers";
            DataTable table = new DataTable();
            MySqlDataAdapter adp = new MySqlDataAdapter(zapros, con);
            adp.Fill(table);
            foreach (DataRow row in table.Rows)
            {
                fasad.create_worker_list(row.ItemArray);
            }
            zapros = "SELECT * FROM work";
            adp = new MySqlDataAdapter(zapros, con);
            table = new DataTable();
            adp.Fill(table);
            foreach (DataRow row in table.Rows)
            {
                fasad.create_work_list(row.ItemArray);
            }
            zapros = "SELECT * FROM jobs";
            adp = new MySqlDataAdapter(zapros, con);
            table = new DataTable();
            adp.Fill(table);
            foreach (DataRow row in table.Rows)
            {
                fasad.create_job_list(row.ItemArray);
            }
        }
    }
}
