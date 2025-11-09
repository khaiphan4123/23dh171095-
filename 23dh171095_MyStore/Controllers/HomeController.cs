using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using _23dh171095_MyStore.Models;
using _23dh171095_MyStore.Models.ViewsModel;
using PagedList;

namespace _23dh171095_MyStore.Controllers
{
    public class HomeController : Controller
    {
        private MystoreEntities db = new MystoreEntities();

        // GET: Home
        public ActionResult Index(string searchTerm, int? page)
        {
            var model = new HomeProductVM();
            var products = db.Products.AsQueryable();

            // Tìm kiếm sản phẩm dựa trên từ khóa
            if (!string.IsNullOrEmpty(searchTerm))
            {
                model.SearchTerm = searchTerm;
                products = products.Where(p =>
                    p.ProductName.Contains(searchTerm) ||
                    p.ProductDescription.Contains(searchTerm) ||
                    p.Category.CategoryName.Contains(searchTerm));
            }

            // Phân trang
            int pageNumber = page ?? 1;
            int pageSize = 6;

            // Sản phẩm nổi bật (bán chạy nhất)
            model.FeaturedProducts = products
                .OrderByDescending(p => p.OrderDetails.Count())
                .Take(10)
                .ToList();

            // Sản phẩm mới (bán ít nhất) có phân trang
            model.NewProducts = products
                .OrderBy(p => p.OrderDetails.Count())
                .Take(20)
                .ToPagedList(pageNumber, pageSize);

            return View(model);
        }

        public ActionResult Test()
        {
            var vm = new HomeProductVM { SearchTerm = "Test Razor" };
            return View(vm);
        }

        // Action Method ProductDetails đã được hoàn thiện
        public ActionResult ProductDetails(int? id, int? quantity, int? page)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            Product pro = db.Products.Find(id);

            if (pro == null)
            {
                return HttpNotFound();
            }

            // lấy tất cả các sản phẩm cùng danh mục
            var products = db.Products.Where(p => p.CategoryID == pro.CategoryID && p.ProductID != pro.ProductID).AsQueryable();

            ProductDetailsVM model = new ProductDetailsVM();

            // Lấy thông số phân trang từ ViewModel (mặc định trong VM là 3)
            int pageNumber = page ?? 1;
            int pageSize = model.PageSize;

            // Gán sản phẩm chính
            model.product = pro;

            // Lấy danh sách sản phẩm cùng danh mục (liên quan)
            model.RelatedProducts = products
                .OrderBy(p => p.ProductID) // Sắp xếp theo ID
                .Take(8) // Chỉ lấy 8 sản phẩm đầu tiên
                .ToPagedList(pageNumber, pageSize);

            // Lấy danh sách sản phẩm bán chạy nhất cùng danh mục
            model.TopProducts = products
                .OrderByDescending(p => p.OrderDetails.Count()) // Sắp xếp giảm dần theo số lượng bán
                .Take(8) // Chỉ lấy 8 sản phẩm đầu tiên
                .ToPagedList(pageNumber, pageSize);

            // Gán số lượng (nếu có từ tham số)
            if (quantity.HasValue)
            {
                model.quantity = quantity.Value;
            }

            // Trả về View cùng với ViewModel
            return View(model);
        }
    }
}