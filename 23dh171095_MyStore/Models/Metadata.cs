using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace _23dh171095_MyStore.Models
{
    public class CategoryMetadata
    {
        [HiddenInput]
        public int CategoryID { get; set; }
        [Required]
        [StringLength(50, MinimumLength = 5)]
        public string CategoryName { get; set; }
    }
    public class UserMetadata
    {
        [Required(ErrorMessage = "Username is required!")]
        [StringLength(30, MinimumLength = 3)]
        [RegularExpression(@"^[\r\n \t]*[a-zA-Z0-9_]{3,18}[\r\n \t]*", ErrorMessage = "Username is invalid.")] // Regex được cố gắng chép lại chính xác nhất có thể từ ảnh
        public string Username { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required]
        public string Role { get; set; }
    }

    public class CustomerMetadata
    {
        // ... (Nội dung của lớp này không được hiển thị đầy đủ)
    }

    public class ProductMetadata
    {
        // SỬA: ProID -> ProductID
        [Display(Name = "Mã sản phẩm")]
        public int ProductID { get; set; }

        // SỬA: ProName -> ProductName
        [StringLength(50)]
        [Required(ErrorMessage = "Phải nhập tên sản phẩm")]
        [Display(Name = "Tên sản phẩm")]
        public string ProductName { get; set; }

        // SỬA: CatID -> CategoryID
        [Display(Name = "Chủng loại sản phẩm")]
        public int CategoryID { get; set; }

        // SỬA: ProImage -> ProductImage
        [Display(Name = "Đường dẫn ảnh sản phẩm")]
        [DefaultValue("~/Content/images/default_img.jfif")]
        public string ProductImage { get; set; }

        // SỬA: NameDecription -> ProductDescription
        [Display(Name = "Mô tả sản phẩm")]
      
        public string ProductDescription { get; set; }



        //[DisplayName("")] // Dòng này đang được comment (//)
        public string ProImage { get; set; }
        
        [Display(Name = "Mô tả sản phẩm")]
        public string NameDecription { get; set; }

        [DefaultValue(true)]
        public System.DateTime CreatedDate { get; set; }
    }
}
    

    
    public class SupplierMetadata
    { }
