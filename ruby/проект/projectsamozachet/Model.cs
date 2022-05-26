using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks; 


namespace projectsamozachet
{
   public class Fasad
    {
        public Worker_list worker_List;
        public Job_list job_list;
        public Work_list work_list;
        public Fasad()
        {
        this.worker_List = Worker_list.get_instanse();
        this.job_list = Job_list.get_instanse();
        this.work_list = Work_list.get_instanse();
        }
        public void create_worker_list(Object[] obj)
        {
         worker_List.add_el(new Worker(Convert.ToInt32(obj[0]),obj[1].ToString(),obj[2].ToString(),obj[3].ToString()));
        }
        public void create_job_list(Object[] obj)
        {

            job_list.add_el(new Job(
               Convert.ToInt32( obj[0]),
               Convert.ToInt32(obj[1]),
                Convert.ToInt32(obj[2]),
                obj[3].ToString(),
                obj[4].ToString()));
        }
        public void create_work_list(Object[] obj)
        {
            work_list.add_el(new Work(
               Convert.ToInt32(obj[0]),
                 obj[1].ToString(),
                Convert.ToInt32(obj[2])
                ));
        }
        public void update_worker_list(Object[] obj)
            {
            worker_List.update_el(new Worker(Convert.ToInt32(obj[0]), obj[1].ToString(), obj[2].ToString(), obj[3].ToString()));
        }
        public void update_job_list(Object[] obj)
        {
            job_list.update_el(new Job(
               Convert.ToInt32(obj[0]),
               Convert.ToInt32(obj[1]),
                Convert.ToInt32(obj[2]),
                obj[3].ToString(),
                obj[4].ToString()
                ));
        }
        public void update_work_list(Object[] obj)
        {
            work_list.update_el(new Work(
               Convert.ToInt32(obj[0]),
                 obj[1].ToString(),
                Convert.ToInt32(obj[2])
                ));
        }
        public bool valid_job(Object[] obj)
        {
            bool c = true;
            if (this.worker_List.get_full_id().Contains(obj[1]))
                c = false;
            if (this.work_list.get_full_id().Contains(obj[2]))
                c = false;
            return c;
        }
        public class Worker : Id
        {
            public int Id_worker { get; set; }
            public string First_name { get; set; }
            public string Second_name { get; set; }
            public string Number { get; set; }
            public Worker(int id_client, string first_name, string second_name, string number)
            {
                Id_worker = id_client;
                First_name = first_name;
                Second_name = second_name;
                Number = number;
            }
            public int id()
            {
                return Id_worker;
            }
            public List<String> mass_s()
            {
                List<String> array = new List<String>();
                array.Add(Id_worker.ToString());
                array.Add(First_name);
                array.Add(Second_name);
                array.Add(Number);
                return array;
            }
        }
        public class Work : Id
        {
            public int Id_work { get; set; }
            public string Name_work { get; set; }
            public int Salary { get; set; }

            public Work(int id_discount, string discount_kol, int kolvo_zakaz)
            {
                Id_work = id_discount;
                Name_work = discount_kol;
                Salary = kolvo_zakaz;
            }
            public int id()
            {
                return Id_work;
            }
            public List<String> mass_s()
            {
                List<String> array = new List<String>();
                array.Add(Id_work.ToString());
                array.Add(Name_work);
                array.Add(Salary.ToString());
                return array;
            }

        }
        public class Job : Id
        {
            public int Id_job { get; set; }
            public int Id_worker { get; set; }
            public int Id_work { get; set; }
            public string data_start { get; set; }
            public string data_end { get; set; }
     
            public Job(int id_order,
                int id_type_order,
                int id_client,
                string id_clothes,
                string description="3000-01-01")
             
            {
                Id_job = id_order;
                Id_worker = id_type_order;
                Id_work = id_client;
                data_start = id_clothes;
                data_end = description;
            }
            public int id()
            {
                return Id_job;
            }
            public List<String> mass_s()
            {
                List<String> array = new List<String>();
                array.Add(Id_job.ToString());
                array.Add(Id_worker.ToString());
                array.Add(Id_work.ToString());
                array.Add(data_start);
                array.Add(data_end);
                return array;
            }

        }

        interface Id
        {
            int id();
        }

        interface IList<T>
        {
            void add_el(T obj);
            void delete_el(int id);
            void update_el(T obj);
            Object select_el(T obj);
        }

        public class Worker_list : IList<Worker>
        {
            private List<Worker> worker_list;
            private static Worker_list one;
            private Worker_list()
            {
                worker_list = new List<Worker>();
            }
            public static Worker_list get_instanse()
            {
                if (one == null)
                {
                    one = new Worker_list();
                }
                return one;
            }
            public void add_el(Worker klient)
            {
                this.worker_list.Add(klient);
            }
            public void delete_el(int id)
            {
                this.worker_list.RemoveAll(klient => klient.id() == id);
            }
            public void update_el(Worker id)
            {
                Worker old_klient = this.worker_list.Find(Klient => Klient.id() == id.id());
                old_klient.Id_worker = id.Id_worker;
                old_klient.First_name = id.First_name;
                old_klient.Second_name = id.Second_name;
                old_klient.Number = id.Number;
            }
            public Object select_el(Worker obj)
            {
                return 1;
            }
            public List<List<string>> mass_worker()
            {
                List<List<string>> mass = new List<List<string>>();
                foreach (Worker i in this.worker_list)
                {
                    mass.Add(i.mass_s());
                }
                return mass;
            }
            public List<string> get_full_id()
            {
                List<string> ids = new List<string>();
                foreach(Worker i in  worker_list)
                {
                    ids.Add(i.id().ToString());

                }
                return ids;
            }

        }
       
        public class Job_list : IList<Job>
        {
            private List<Job> job_list;
            private static Job_list one;
            private Job_list()
            {
                job_list = new List<Job>();
            }
            public static Job_list get_instanse()
            {
                if (one == null)
                {
                    one = new Job_list();
                }
                return one;
            }
            public void add_el(Job klient)
            {
                this.job_list.Add(klient);
            }
            public void delete_el(int id)
            {
                this.job_list.RemoveAll(klient => klient.id() == id);
            }
            public void update_el(Job id)
            {
                Job old_order = this.job_list.Find(Klient => Klient.id() == id.id());
                old_order.Id_job = id.Id_job;
                old_order.Id_worker = id.Id_worker;
                old_order.Id_work = id.Id_work;
                old_order.data_start = id.data_start;
                old_order.data_end = id.data_end;
            }
            public Object select_el(Job obj)
            {
                return 1;
            }
            public List<List<string>> mass_job()
            {
                List<List<string>> mass = new List<List<string>>();
                foreach (Job i in this.job_list)
                {
                    mass.Add(i.mass_s());
                }
                return mass;
            }
            public List<string> get_full_id()
            {
                List<string> ids = new List<string>();
                foreach (Job i in job_list)
                {
                    ids.Add(i.id().ToString());

                }
                return ids;
            }
        }

        public class Work_list : IList<Work>
        {
            private List<Work> work_list;
            private static Work_list one;
            private Work_list()
            {
                work_list = new List<Work>();
            }
            public static Work_list get_instanse()
            {
                if (one == null)
                {
                    one = new Work_list();
                }
                return one;
            }
            public void add_el(Work klient)
            {
                this.work_list.Add(klient);
            }
            public void delete_el(int id)
            {
                this.work_list.RemoveAll(klient => klient.id() == id);
            }
            public void update_el(Work id)
            {
                Work old_klient = this.work_list.Find(Klient => Klient.id() == id.id());
             
                old_klient.Id_work = id.Id_work;
                old_klient.Name_work = id.Name_work;
                old_klient.Salary = id.Salary;
            }
            public Object select_el(Work obj)
            {
                return 1;
            }
            public List<List<string>> mass_klient()
            {
                List<List<string>> mass = new List<List<string>>();
                foreach (Work i in this.work_list)
                {
                    mass.Add(i.mass_s());
                }
                return mass;
            }

            public List<string> get_full_id()
            {
                List<string> ids = new List<string>();
                foreach (Work i in work_list)
                {
                    ids.Add(i.id().ToString());

                }
                return ids;
            }

        }

      


   }
}
