using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using _23dh171095_MyStore.Models;
using _23dh171095_MyStore.Models.ViewsModel;
using static System.Collections.Specialized.BitVector32;

namespace _23dh171095_MyStore.Controllers
{
    public class AccountController : Controller
    {
        // Trong AccountController.cs
        private MystoreEntities db = new MystoreEntities();

        // GET: Account/Register
        public ActionResult Register()
        {
            return View();
        }

        // POST: Account/Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(RegisterVM model)
        {
            if (ModelState.IsValid)
            {
                //kiểm tra xem tên đăng nhập đã tồn tại chưa
                var exsistinguser2 = db.Users.SingleOrDefault(u => u.Username == model.Username);
                if (exsistinguser2 != null)
                {
                    ModelState.AddModelError("Username", "Tên đăng nhập này đã tồn tại!");
                    return View(model);
                }

                //nếu chưa tồn tại thì tạo bản ghi thông tin tài khoản trong bảng User
                var user = new User
                {
                    Username = model.Username,
                    Password = model.Password, // Lưu ý: Nên mã hóa mật khẩu trước khi lưu
                    UserRole = "Customer"
                };
                db.Users.Add(user);

                //và tạo bản ghi thông tin khách hàng trong bảng Customer
                var customer = new customer2
                {
                    CustomerName = model.CustomerName,
                    CustomerEmail = model.CustomerEmail,
                    CustomerPhone = model.CustomerPhone,
                    CustomerAddress = model.CustomerAddress,
                    Username = model.Username,
                };
                db.Customers.Add(customer);

                //Lưu thông tin tài khoản và thông tin khách hàng vào CSDL
                db.SaveChanges();
                return RedirectToAction("Index", "Home");
            }

            return View(model);
        }
    }
    // POST: Account/Login
[HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginVM model)
        {
            if (ModelState.IsValid)
            {
                // 1. Tìm kiếm người dùng trong CSDL
                var user = db.Users.SingleOrDefault(u =>
                    u.Username == model.Username
                    && u.Password == model.Password
                    && u.UserRole == "Customer");

                if (user != null)
                {
                    // 2. Nếu đăng nhập thành công

                    // //Lưu trạng thái đăng nhập vào session
                    Session["Username"] = user.Username;
                    Session["UserRole"] = user.UserRole;

                    // //Lưu thông tin xác thực người dùng vào cookie
                    FormsAuthentication.SetAuthCookie(user.Username, false);

                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    // 3. Nếu đăng nhập thất bại
                    ModelState.AddModelError("", "Tên đăng nhập hoặc mật khẩu không đúng.");
                }
            }

            return View(model);
        }
    
           // GET: Account/Logout
          public ActionResult Logout()
            {
                         Session.Clear();
                       return RedirectToAction("Login", "Account");
           }
}