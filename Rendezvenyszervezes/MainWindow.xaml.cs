using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using MySql.Data.MySqlClient;
using Rendezvenyszervezes;
using Rendezvenyszervezo.Models;


namespace Rendezvenyszervezo
{
    public partial class MainWindow : Window
    {
        private readonly MySqlConnection _connection;
        private readonly MySqlDataAdapter _rendezvenyDataAdapter;
        private readonly MySqlDataAdapter _szolgaltatasDataAdapter;
        private readonly DataSet _dataSet;

        public MainWindow()
        {
            InitializeComponent();

            string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            _connection = new MySqlConnection(connectionString);

            _rendezvenyDataAdapter = new MySqlDataAdapter();
            _rendezvenyDataAdapter.SelectCommand = new MySqlCommand("SELECT * FROM rendezvenyek", _connection);

            _szolgaltatasDataAdapter = new MySqlDataAdapter();
            _szolgaltatasDataAdapter.SelectCommand = new MySqlCommand("SELECT * FROM szolgaltatasok", _connection);

            _dataSet = new DataSet();
        }

        private void LoadData()
        {
            try
            {
                _connection.Open();
                _dataSet.Clear();
                _rendezvenyDataAdapter.Fill(_dataSet, "rendezvenyek");
                rendezvenyekDataGrid.DataContext = _dataSet.Tables["rendezvenyek"].DefaultView;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Hiba történt a betöltés során: " + ex.Message);
            }
            finally
            {
                _connection.Close();
            }
        }

        private void LoadSzolgaltatasokData()
        {
            try
            {
                _connection.Open();
                _dataSet.Clear();
                _szolgaltatasDataAdapter.Fill(_dataSet, "szolgaltatasok");
                szolgaltatasokDataGrid.DataContext = _dataSet.Tables["szolgaltatasok"].DefaultView;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Hiba történt a betöltés során: " + ex.Message);
            }
            finally
            {
                _connection.Close();
            }
        }

        private void OnNewRendezvenyClick(object sender, RoutedEventArgs e)
        {
            var rendezveny = new Rendezveny();
            var newRendezvenyWindow = new RendezvenyWindow(rendezveny);

            if (newRendezvenyWindow.ShowDialog() == true)
            {
                rendezveny = newRendezvenyWindow.Rendezveny;

                var command = new MySqlCommand("INSERT INTO rendezvenyek (Nev, Datum, Helyszin, Leiras) VALUES (@Nev, @Datum, @Helyszin, @Leiras)", _connection);
                command.Parameters.AddWithValue("@Nev", rendezveny.Nev);
                command.Parameters.AddWithValue("@Datum", rendezveny.Datum);
                command.Parameters.AddWithValue("@Helyszin", rendezveny.Helyszin);
                command.Parameters.AddWithValue("@Leiras", rendezveny.Leiras);

                try
                {
                    _connection.Open();
                    command.ExecuteNonQuery();
                    LoadData();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Hiba történt a mentés során: " + ex.Message);
                }
                finally
                {
                    _connection.Close();
                }
            }
        }





        private void OnRendezvenyekListajaClick(object sender, RoutedEventArgs e)
        {
            LoadData();
        }

        private void OnNewSzolgaltatasClick(object sender, RoutedEventArgs e)
        {
            var newSzolgaltatasWindow = new SzolgaltatasWindow();
            if (newSzolgaltatasWindow.ShowDialog() == true)
            {
                var szolgaltatas = newSzolgaltatasWindow.Szolgaltatas;
                var command = new MySqlCommand("INSERT INTO szolgaltatasok (Nev, Leiras, Ar) VALUES (@Nev, @Leiras, @Ar)", _connection);
                command.Parameters.AddWithValue("@Nev", szolgaltatas.Nev);
                command.Parameters.AddWithValue("@Leiras", szolgaltatas.Leiras);
                command.Parameters.AddWithValue("@Ar", szolgaltatas.Ar);
                try
                {
                    _connection.Open();
                    command.ExecuteNonQuery();
                    LoadSzolgaltatasokData();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Hiba történt a mentés során: " + ex.Message);
                }
                finally
                {
                    _connection.Close();
                }
            }
        }

        private void OnSzolgaltatasokListajaClick(object sender, RoutedEventArgs e)
        {
            LoadSzolgaltatasokData();
        }

        private void OnExitClick(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }
    }
}
