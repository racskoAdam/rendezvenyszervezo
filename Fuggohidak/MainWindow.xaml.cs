using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.IO;
using MySql.Data.MySqlClient;
using System.Data;

namespace Fuggohidak
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            FillGrid("SELECT * FROM fuggohidak");
        }

        public void FillGrid(string sql)
        {
            string MyConString =
            "SERVER=localhost;" +
            "DATABASE=hidak;" +
            "UID=root;" +
            "PASSWORD=;";

            MySqlConnection connection = new MySqlConnection(MyConString);
            MySqlCommand cmdSel = new MySqlCommand(sql, connection);
            DataTable dt = new DataTable();
            MySqlDataAdapter da = new MySqlDataAdapter(cmdSel);
            da.Fill(dt);
            dataGrid.DataContext = dt;
        }

        public string Select(string sql)
        {
            string MyConString =
            "SERVER=localhost;" +
            "DATABASE=hidak;" +
            "UID=root;" +
            "PASSWORD=;";

            MySqlConnection connection = new MySqlConnection(MyConString);
            MySqlCommand cmdSel = new MySqlCommand(sql, connection);
            connection.Open();
            using (MySqlDataReader reader = cmdSel.ExecuteReader())
            {
                while (reader.Read()) // If you're expecting only one line, change this to if(reader.Read()).
                {
                    return reader.GetString(0);
                }
            }
            return null;
        }

        private void pre2000_Checked(object sender, RoutedEventArgs e)
        {
            bridgeCount.Text = Select("SELECT COUNT(helyezes) FROM fuggohidak WHERE ev < 2000");
        }

        private void post2000_Checked(object sender, RoutedEventArgs e)
        {
            bridgeCount.Text = Select("SELECT COUNT(helyezes) FROM fuggohidak WHERE ev >= 2000");
        }

        private void dataGrid_SelectedCellsChanged(object sender, SelectedCellsChangedEventArgs e)
        {
            DataRowView rowView = dataGrid.SelectedItem as DataRowView;
            hely.Text = rowView["hely"].ToString();
            orszag.Text = rowView["orszag"].ToString();
            hossz.Text = rowView["hossz"].ToString();
            ev.Text = rowView["ev"].ToString();
        }

        private void MenuItem_Click(object sender, RoutedEventArgs e)
        {
            Kereses kereses = new Kereses();
            kereses.Show();
            this.Close();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
