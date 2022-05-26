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
    public partial class Workers : Form
    {
        Fasad fasad;
        MySqlConnection con;
        MySqlCommand command;
        public Workers(Fasad fas)
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
            this.dataGridView_workers.Columns.Add("id_workers", "id_workers");
            this.dataGridView_workers.Columns.Add("name", "name");
            this.dataGridView_workers.Columns.Add("sename", "sename");
            this.dataGridView_workers.Columns.Add("number", "number");
        }
        void data_resause()
        {
            this.dataGridView_workers.Rows.Clear();
            List<List<string>> mass_workers = this.fasad.worker_List.mass_worker();
            foreach (List<string> i in mass_workers)
            {
                dataGridView_workers.Rows.Add(i[0], i[1], i[2], i[3]);
            }
        }

        private void dataGridView_workers_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void Workers_Load(object sender, EventArgs e)
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
            string name = textBox2.Text;
            string sename = textBox3.Text;
            string namber = textBox4.Text;
           if( el_is_valid(name,sename,namber)&&(!fasad.worker_List.get_full_id().Contains(id.ToString())))
           {
                Object[] mass = { id, name, sename, namber };
                fasad.create_worker_list(mass);
                string insert_query = "INSERT INTO workers(id_workers, name,sename,number) VALUES (" + id.ToString() + ",\"" + name + "\",\"" + sename + "\",\"" + namber + "\")";
                executeMyQuery(insert_query);
            }
            data_resause();

        }
        private void button_update_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(textBox1.Text);
            string name = textBox2.Text;
            string sename = textBox3.Text;
            string namber = textBox4.Text;
            if (el_is_valid(name, sename, namber) && (fasad.worker_List.get_full_id().Contains(id.ToString())))
            {
                Object[] mass = { id, name, sename, namber };
                fasad.update_worker_list(mass);
                string insert_query =string.Format( "UPDATE workers SET `id_workers`={0},`name`='{1}',`sename`='{2}',`number`='{3}' WHERE `id_workers`={0}",id.ToString(),name,sename,namber);
                executeMyQuery(insert_query);
            }
            data_resause();
        }

        private void button_delete_Click(object sender, EventArgs e)
        {
            fasad.worker_List.delete_el(Convert.ToInt32(textBox1.Text));
            string insert_query = string.Format("DELETE FROM `workers` WHERE `id_workers`={0}", Convert.ToInt32(textBox1.Text));
            executeMyQuery(insert_query);
            data_resause();
        }
        private bool el_is_valid(string name,string sename,string number)
        {
            bool c = true;
        string regex = @"[0-9]{11}";
            if(!Regex.IsMatch(number,regex))
            {
                c = false;
            }
            if (name=="" || sename=="")
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
