using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.IO;
using MySql.Data.MySqlClient;
using System.Data;

namespace Fuggohidak
{
    /// <summary>
    /// Interaction logic for Kereses.xaml
    /// </summary>
    public partial class Kereses : Window
    {
        public Kereses()
        {
            InitializeComponent();
            string MyConString =
                "SERVER=localhost;" +
                "DATABASE=hidak;" +
                "UID=root;" +
                "PASSWORD=;";

            MySqlConnection connection = new MySqlConnection(MyConString);

            MySqlCommand cmd = new MySqlCommand("SELECT DISTINCT orszag FROM `fuggohidak` WHERE 1", connection);
            connection.Open();


            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            connection.Close();

            orszagSelect.ItemsSource = dt.DefaultView;
        }

        private void close_Click(object sender, RoutedEventArgs e)
        {
            MainWindow main = new MainWindow();
            main.Show();
            this.Close();
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

        private void search_Click(object sender, RoutedEventArgs e)
        {
            string query = $"SELECT * FROM fuggohidak WHERE orszag = '{orszagSelect.Text}'";
            if (moreThan1km.IsChecked.Value)
            {
                query += " AND hossz > 1000";
            }
            FillGrid(query);
        }
    }
}
