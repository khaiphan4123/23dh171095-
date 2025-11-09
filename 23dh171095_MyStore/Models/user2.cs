using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _23dh171095_MyStore.Models
{
    public class user2
    {
       
        public partial class User
        {
            [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
            public User()
            {
                this.Customers = new HashSet<customer2>();
            }

            public string Username { get; set; }
            public string Password { get; set; }
            public string UserRole { get; set; }

            [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
            public virtual ICollection<customer2> Customers { get; set; }
        }
    }
}