using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace MVC_mcs_Ajax.Models
{
    public static class LoaderModel
    {
        private static readonly string PathToLoader = new DirectoryInfo(AppDomain.CurrentDomain.BaseDirectory)?.FullName + "/Content/loader";
        private static readonly Random Rnd = new Random();
        private static readonly string[] AllLoaders = ReturnAllLoaders();
        private static string[] ReturnAllLoaders()
        {

            try
            {
                DirectoryInfo directoryInfo = new DirectoryInfo(PathToLoader);
                string[] files = directoryInfo.GetFiles().Select(s => s.Name).ToArray();
                return files;
            }
            catch (Exception e)
            {
                return null;
            }
        }


        public static string GetRandomLoader()
        {
            return AllLoaders[Rnd.Next(0, AllLoaders.Length)];
        }
    }
}