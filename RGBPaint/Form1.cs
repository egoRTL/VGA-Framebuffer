using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RGBPaint
{
    public partial class Form1 : Form
    {
        Bitmap pic;
        Size size;
        Graphics g;
        Rectangle compression_rectangle;
        int x1, y1;
        public Form1()
        {
            InitializeComponent();
            pic = new Bitmap(pictureBox1.Width, pictureBox1.Height);
            //compression_rectangle = new Rectangle(0, 0, 80, 60);
            size = new Size(80, 60);
            x1 = y1 = 0;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            button5.BackColor = b.BackColor;
        }

        private void saveToolStripMenuItem_Click(object sender, EventArgs e)
        {
            saveFileDialog1.ShowDialog();
            Bitmap pic2 = new Bitmap(pictureBox1.Image, size);
            if (saveFileDialog1.FileName != "") pic2.Save(saveFileDialog1.FileName);
        }

        private void openToolStripMenuItem_Click(object sender, EventArgs e)
        {
            openFileDialog1.ShowDialog();
            if(openFileDialog1.FileName != "")
            {
                pic = (Bitmap)Image.FromFile(openFileDialog1.FileName);
                pictureBox1.Image = pic;
            }
        }

        private void saveRGBToolStripMenuItem_Click(object sender, EventArgs e)
        {
            saveFileDialog1.ShowDialog();
            Bitmap pic2 = new Bitmap(pictureBox1.Image, size);
            for (int i = 0; i < pic2.Height; i++)
            {
                for (int j = 0; j < pic2.Width; j++)
                {
                    int pixelcolor = pic2.GetPixel(j, i).ToArgb();
                    //Boolean isblack = pixelcolor == Color.Black;
                    //Boolean isred = pixelcolor == Color.Red;
                    //Boolean isgreen = pixelcolor == Color.Green;
                    //Boolean isblue = pixelcolor == Color.Blue;
                    int colorargb = Color.Black.ToArgb();
                    Boolean isblack = pixelcolor == colorargb;
                    colorargb = Color.Red.ToArgb();
                    Boolean isred = pixelcolor == colorargb;
                    colorargb = Color.Green.ToArgb();
                    Boolean isgreen = pixelcolor == colorargb;
                    colorargb = Color.Blue.ToArgb();
                    Boolean isblue = pixelcolor == colorargb;
                    if ((isblack || isred || isgreen || isblue) == false)
                    pic2.SetPixel(j, i, Color.White);
                }
            }
            if (saveFileDialog1.FileName != "") pic2.Save(saveFileDialog1.FileName);
        }

        private void pictureBox1_MouseMove(object sender, MouseEventArgs e)
        {
            Pen p = new Pen(button5.BackColor, trackBar1.Value);
            p.StartCap = System.Drawing.Drawing2D.LineCap.Round;
            p.EndCap = System.Drawing.Drawing2D.LineCap.Round;
            g = Graphics.FromImage(pic);
            if (e.Button == MouseButtons.Left)
            {
                g.DrawLine(p, x1, y1, e.X, e.Y);
                pictureBox1.Image = pic;
            }
            x1 = e.X;
            y1 = e.Y;
        }
    }
}
