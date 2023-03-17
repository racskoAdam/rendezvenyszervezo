using System.Windows;

namespace Rendezvenyszervezo
{
    public partial class SzolgaltatasWindow : Window
    {
        public Szolgaltatas Szolgaltatas { get; set; }

        public SzolgaltatasWindow()
        {
            InitializeComponent();
            Szolgaltatas = new Szolgaltatas();
            DataContext = Szolgaltatas;
        }

        private void OnSaveClick(object sender, RoutedEventArgs e)
        {
            DialogResult = true;
        }

        private void OnCancelClick(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
        }
    }
}
