using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Desktop.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Desktop.VM
{
    public partial class CategoryVM:ObservableObject
    {
        private POSDbContext _dbContext;
        [ObservableProperty]
        public string? categoryName;
        [ObservableProperty]
        public int categoryId;
        [ObservableProperty] 
        public string? id;
        [ObservableProperty]
        public User? user;
        [ObservableProperty]
        public ObservableCollection<Category> categories;

        public Category? SelectedCategory { get; set; }
        public Category? Category;


        public CategoryVM()
        {
            _dbContext = new POSDbContext();
            categories = new ObservableCollection<Category>();
            SearchCommand = new RelayCommand(SearchCategory);
            LoadData();
        }

      

        private void LoadData()
        {
            var categories = _dbContext.Categories.ToList();
            Categories.Clear();
            foreach (var category in categories)
            {
                Categories.Add(category);
            }
        }
        [RelayCommand]
        public void InsertCategory()
        {
            var cate = _dbContext.Categories.FirstOrDefault(u => u.CategoryId == CategoryId);
            if (cate != null)
            {
                MessageBox.Show("CategoryId already Exist..");
                return;
            }

            if (cate == null)
            {
                cate = new Category()
                {
                    CategoryName = CategoryName,
                    CategoryId = CategoryId,
                    Id = Id

                };
            }
            else
            {

                cate.CategoryName = CategoryName;
                cate.CategoryId = CategoryId;
                cate.Id = Id;

            }


            _dbContext.Categories.Add(cate);
            _dbContext.SaveChanges();
            Categories.Add(cate);
            //cate = SelectedCategory;
            CategoryName = null;
            CategoryId = 0;


            LoadData();
        }


        [RelayCommand]
        public void EditCategory()
        {
            if (SelectedCategory != null)
            {
                Category c = SelectedCategory;
                CategoryName = c.CategoryName;
                CategoryId = c.CategoryId;
                Id=c.Id;
                _dbContext.Remove(c);
                _dbContext.SaveChanges();


            }
            else
            {
                MessageBox.Show("please select a category", "Warning");
            }
        }

        [RelayCommand]
        public void DeleteCategory()
        {
            if (SelectedCategory != null)
            {
                _dbContext.Categories.Remove(SelectedCategory);
                _dbContext.SaveChanges();
                Categories.Remove(SelectedCategory);
            }
            else
            {
                MessageBox.Show("Select a category.", "Warning");
            }

        }

        private string? searchText;
        public string? SearchText
        {
            get => searchText;
            set
            {
                SetProperty(ref searchText, value);
                SearchCategory();
            }
        }

        public RelayCommand SearchCommand { get; }

        private void SearchCategory()
        {
            using (var db = new POSDbContext())
            {
                if (string.IsNullOrWhiteSpace(SearchText))
                {
                    Categories = new ObservableCollection<Category>(db.Categories.ToList());
                }
                else
                {
                    Categories = new ObservableCollection<Category>(db.Categories.Where(u => u.CategoryName.Contains(SearchText)).ToList());
                }
            }
        }
    }
}
