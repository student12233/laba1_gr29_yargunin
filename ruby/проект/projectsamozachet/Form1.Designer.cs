
namespace projectsamozachet
{
    partial class Form1
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.work = new System.Windows.Forms.Button();
            this.job = new System.Windows.Forms.Button();
            this.worker = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // work
            // 
            this.work.Location = new System.Drawing.Point(12, 125);
            this.work.Name = "work";
            this.work.Size = new System.Drawing.Size(378, 324);
            this.work.TabIndex = 2;
            this.work.Text = "Work";
            this.work.UseVisualStyleBackColor = true;
            this.work.Click += new System.EventHandler(this.work_Click);
            // 
            // job
            // 
            this.job.Location = new System.Drawing.Point(500, 125);
            this.job.Name = "job";
            this.job.Size = new System.Drawing.Size(378, 324);
            this.job.TabIndex = 3;
            this.job.Text = "Job";
            this.job.UseVisualStyleBackColor = true;
            this.job.Click += new System.EventHandler(this.job_Click);
            // 
            // worker
            // 
            this.worker.Location = new System.Drawing.Point(991, 125);
            this.worker.Name = "worker";
            this.worker.Size = new System.Drawing.Size(378, 324);
            this.worker.TabIndex = 4;
            this.worker.Text = "Worker";
            this.worker.UseVisualStyleBackColor = true;
            this.worker.Click += new System.EventHandler(this.worker_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1381, 648);
            this.Controls.Add(this.worker);
            this.Controls.Add(this.job);
            this.Controls.Add(this.work);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button work;
        private System.Windows.Forms.Button job;
        private System.Windows.Forms.Button worker;
    }
}

