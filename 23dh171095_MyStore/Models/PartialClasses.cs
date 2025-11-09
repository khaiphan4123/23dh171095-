using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace _23dh171095_MyStore.Models
{
    [MetadataType(typeof(UserMetadata))]
    public partial class User
    {
        [NotMapped]
        [Compare("Password")]
        public string ConfirmedPassword { get; set; }
    }

    [MetadataType(typeof(ProductMetadata))]
    public partial class Product
    {
        [NotMapped]
        public HttpPostedFileBase UploadImage { get; set; }

        [NotMapped]
        public List<ProDetail> RemainProducts { get; set; }
    }
}