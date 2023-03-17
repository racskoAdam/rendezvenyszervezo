using System.Windows;
using Rendezvenyszervezo.Models;

namespace Rendezvenyszervezo
{
    public partial class RendezvenyWindow : Window
    {
        private Rendezveny rendezveny;

        public Rendezveny Rendezveny
        {
            get { return rendezveny; }
            set { rendezveny = value; }
        }

        public RendezvenyWindow(Rendezveny rendezveny)
        {
            InitializeComponent();

            this.rendezveny = rendezveny;

            DataContext = rendezveny;
        }

        private void OnCancelClick(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void OnSaveClick(object sender, RoutedEventArgs e)
        {
            DialogResult = true;
            Close();
        }
    }

}
