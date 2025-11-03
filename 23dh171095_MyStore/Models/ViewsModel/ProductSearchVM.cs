using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList.Mvc;

namespace _23dh171095_MyStore.Models.ViewsModel
{
    public class ProductSearchVM
    { 
        public string SearchTerm {  get; set; }
        public decimal? MinPrice   { get; set; }
        public decimal? MaxPrice { get; set; }
        public string SortOrder {  get; set; }
        // Các thuộc tính hỗ trợ phân trang
        public int PageNumber { get; set; } // Trang hiện tại
        public int PageSize { get; set; } = 10; // Số sản phẩm mỗi trang

        // Danh sách Sản phẩm đã phân trang
        public PagedList.IPagedList<Product> Products { get; set; }

        // danh sách sản phẩm thỏa điều kiện tìm kiếm
        //public List<Product> Products { get; set; }
        

    }
}