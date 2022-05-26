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
    public partial class Works : Form
    {
       
        Fasad fasad;
        MySqlConnection con;
        MySqlCommand command;
        public Works(Fasad fas)
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
        void init_vue()
        {
            this.dataGridView_work.Columns.Add("id_work", "id_work");
            this.dataGridView_work.Columns.Add("name_work", "name_work");
            this.dataGridView_work.Columns.Add("salary", "salary");
        }
        void data_resause()
        {
            this.dataGridView_work.Rows.Clear();
            List<List<string>> mass_workers = this.fasad.work_list.mass_klient();
            foreach (List<string> i in mass_workers)
            {
                dataGridView_work.Rows.Add(i[0], i[1], i[2]);
            }
        }
        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

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
            string name_work = textBox2.Text;
            int salary = Convert.ToInt32(textBox3.Text);
            if (el_is_valid( name_work, salary) && (!fasad.work_list.get_full_id().Contains(id.ToString())))
            {
                Object[] mass = { id, name_work, salary };
                fasad.create_work_list(mass);
                string insert_query = string.Format("INSERT INTO `work`(`id_work`, `name_work`, `salary`) VALUES ('{0}','{1}','{2}')", id.ToString(),name_work,salary);
                executeMyQuery(insert_query);
            }
            data_resause();

        }
        private void button_update_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(textBox1.Text);
            string name_work = textBox2.Text;
            int salary = Convert.ToInt32(textBox3.Text);
            if (el_is_valid(name_work, salary) && (fasad.work_list.get_full_id().Contains(id.ToString())))
            {
                Object[] mass = { id, name_work, salary };
                fasad.update_work_list(mass);
                string insert_query = string.Format("UPDATE `work` SET `id_work`='{0}',`name_work`='{1}',`salary`='{2}' WHERE `id_work`='{0}'", id.ToString(), name_work, salary);
                executeMyQuery(insert_query);
            }
            data_resause();
        }

        private void button_delete_Click(object sender, EventArgs e)
        {
            fasad.work_list.delete_el(Convert.ToInt32(textBox1.Text));
            string insert_query = string.Format("DELETE FROM `work` WHERE `id_work`='{0}'", Convert.ToInt32(textBox1.Text));
            executeMyQuery(insert_query);
            data_resause();
        }
        private bool el_is_valid( string work_name,int salary)
        {
            bool c = true;
            if (salary<=0)
            {
                c = false;
            }
            if (work_name == "")
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

    }
}
