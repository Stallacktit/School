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

namespace GestionEvent
{
    /// <summary>
    /// Logique d'interaction pour MainWindow.xaml
    /// </summary>
    /// 
    public partial class MainWindow : Window
    {

        List<Client> ListClients = new List<Client>();
        public MainWindow()
        {
            InitializeComponent();
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            ListClients.Add(new Client(NameTextBox.Text, LastNameTextBox.Text, RueTextBox.Text, LocaliteTextBox.Text, PostalTextBox.Text));
            Refresh();
        }

        private void Refresh()
        {
            NomPrenomComboBox.Items.Clear();
            foreach (Client tmp in ListClients)
            {
                NomPrenomComboBox.Items.Add(tmp.GetName() +" " + tmp.GetFirstName());
            }
            

        }

        private void NomPrenomComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (NomPrenomComboBox.SelectedIndex > -1 && ListClients.Count > 0)
            MessageBox.Show("Tu as appuyer le nom est :" + ListClients[NomPrenomComboBox.SelectedIndex].GetName());
            else { }
        }
    }
}
