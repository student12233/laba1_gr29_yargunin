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
using System.Text.RegularExpressions;

namespace projectsamozachet
{
    public partial class Jobs : Form
    {
       

        private void Jobs_Load(object sender, EventArgs e)
        {

        }
        Fasad fasad;
        MySqlConnection con;
        MySqlCommand command;
        public Jobs(Fasad fas)
        {
            InitializeComponent();

            this.fasad = fas;
            this.con = new MySqlConnection("server=127.0.0.1;username=root;database=proect");
            podkl();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
        void podkl()
        {
            init_vue();
            data_resause();


        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
        }
        void init_vue()
        {
            this.dataGridViewjob.Columns.Add("id_job", "id_job");
            this.dataGridViewjob.Columns.Add("id_worker", "id_worker");
            this.dataGridViewjob.Columns.Add("id_work", "id_work");
            this.dataGridViewjob.Columns.Add("date_start", "date_start");
            this.dataGridViewjob.Columns.Add("date_end", "date_end");
        }
        void data_resause()
        {
            this.dataGridViewjob.Rows.Clear();
            List<List<string>> mass_workers = this.fasad.job_list.mass_job();
            foreach (List<string> i in mass_workers)
            {
                dataGridViewjob.Rows.Add(i[0], i[1], i[2], i[3],i[4]);
            }
        }
        private void button1_Click(object sender, EventArgs e)
        {
            Form1 dr = new Form1(this.fasad);
            dr.Show();
            Hide();
        }
        private void button_insert_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(textBox1.Text);
            int id_worker = Convert.ToInt32(textBox2.Text);
            int id_work = Convert.ToInt32(textBox3.Text);
            string date_start =textBox4.Text;
            string data_end = textBox5.Text;
            Object[] mass = { id, id_worker, id_work, date_start, data_end };
            if (el_is_valid(date_start, data_end) && (!fasad.job_list.get_full_id().Contains(id.ToString()))&&(fasad.valid_job(mass)))
            {
               
                fasad.create_job_list(mass);
                string insert_query = string.Format("INSERT INTO `jobs`(`id_job`, `id_worker`, `id_work`, `date_start`, `date_end`) VALUES ('{0}','{1}','{2}','{3}','{4}')", id.ToString(), id_worker.ToString(),id_work.ToString(),date_start,data_end);
                executeMyQuery(insert_query);
            }
            data_resause();

        }
        private void button_update_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(textBox1.Text);
            int id_worker = Convert.ToInt32(textBox2.Text);
            int id_work = Convert.ToInt32(textBox3.Text);
            string date_start = textBox4.Text;
            string data_end = textBox5.Text;
            Object[] mass = { id, id_worker, id_work, date_start, data_end };
            if (el_is_valid(date_start, data_end) && (fasad.job_list.get_full_id().Contains(id.ToString()))&&(fasad.valid_job(mass)))
            {
                
                fasad.update_job_list(mass);
                string insert_query = string.Format("UPDATE `jobs` SET `id_job`='{0}',`id_worker`='{1}',`id_work`='{2}',`date_start`='{3}',`date_end`='{4}' WHERE `id_job`='{0}'", id.ToString(), id_worker.ToString(), id_work.ToString(), date_start, data_end);
                executeMyQuery(insert_query);
            }
            data_resause();
        }

        private void button_delete_Click(object sender, EventArgs e)
        {
            fasad.job_list.delete_el(Convert.ToInt32(textBox1.Text));
            string insert_query = string.Format("DELETE FROM `jobs` WHERE `id_job`='{0}'", Convert.ToInt32(textBox1.Text));
            executeMyQuery(insert_query);
            data_resause();
        }
        private bool el_is_valid(string date_start, string data_end)
        {
            string regex = @"(([2]{1}0[0-9]{2})-(0[1-9]{1}|1[0-2]{1})-(0[1-9]{1}|[1-2]{1}[0-9]{1}|3[0-1]{1}))";
            bool c = true;
            if (!Regex.IsMatch(date_start, regex))
            {
                c = false;
            }
            if (!Regex.IsMatch(data_end, regex)&&data_end!="3000-01-01")
            {
                c = false;
            }
            return c;

        }
        public void executeMyQuery(string query)
        {
            try
            {
                openConnection();
                command = new MySqlCommand(query, con);
                if (command.ExecuteNonQuery() == 1)
                {
                    MessageBox.Show("Выполннено");

                }
                else
                {
                    MessageBox.Show("Не выполненно");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                closeConnection();
            }
        }
        public void openConnection()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
        }
        public void closeConnection()
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(textBox1.Text);
            int id_worker = Convert.ToInt32(textBox2.Text);
            int id_work = Convert.ToInt32(textBox3.Text);
            string date_start = textBox4.Text;
            string data_end = textBox5.Text;
            Object[] mass = { id, id_worker, id_work, date_start, data_end };
            if (el_is_valid(date_start, data_end) && (!fasad.job_list.get_full_id().Contains(id.ToString())) && (fasad.valid_job(mass)))
            {
                fasad.create_job_list(mass);
                string insert_query = string.Format("INSERT INTO `jobs`(`id_job`, `id_worker`, `id_work`, `date_start`, `date_end`) VALUES ('{0}','{1}','{2}','{3}','{4}')", id.ToString(), id_worker.ToString(), id_work.ToString(), date_start, data_end);
                executeMyQuery(insert_query);
            }
            data_resause();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(textBox1.Text);
            int id_worker = Convert.ToInt32(textBox2.Text);
            int id_work = Convert.ToInt32(textBox3.Text);
            string date_start = textBox4.Text;
            string data_end = textBox5.Text;
            Object[] mass = { id, id_worker, id_work, date_start, data_end };
            if (el_is_valid(date_start, data_end) && (fasad.job_list.get_full_id().Contains(id.ToString())) && (fasad.valid_job(mass)))
            {

                fasad.update_job_list(mass);
                string insert_query = string.Format("UPDATE `jobs` SET `id_job`='{0}',`id_worker`='{1}',`id_work`='{2}',`date_start`='{3}',`date_end`='{4}' WHERE `id_job`='{0}'", id.ToString(), id_worker.ToString(), id_work.ToString(), date_start, data_end);
                executeMyQuery(insert_query);
            }
            data_resause();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            fasad.job_list.delete_el(Convert.ToInt32(textBox1.Text));
            string insert_query = string.Format("DELETE FROM `jobs` WHERE `id_job`='{0}'", Convert.ToInt32(textBox1.Text));
            executeMyQuery(insert_query);
            data_resause();
        }
    }
}
