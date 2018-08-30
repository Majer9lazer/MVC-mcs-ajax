using System;
using System.IO;
using System.Linq;

namespace MVC_mcs_Ajax.Models
{
    public static class LoaderModel
    {
        private static readonly string PathToLoader = new DirectoryInfo(AppDomain.CurrentDomain.BaseDirectory).FullName + "/Content/loader";
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
    //Бфл написан из-за неправильной генерации данных
    public class LoaderModuleNonStatic
    {
        //не возвращает новое число при каждом вызове
        public LoaderModuleNonStatic()
        {
            _allLoaders = new DirectoryInfo(_pathToLoader).GetFiles().Select(s => s.Name).ToArray();
        }
        private readonly string _pathToLoader = new DirectoryInfo(AppDomain.CurrentDomain.BaseDirectory)?.FullName + "/Content/loader";
        private readonly string[] _allLoaders;

        public int GetLoaderLength()
        {
            return _allLoaders.Length;
        }

        public string GetLoaderById(int id)
        {
            if (id <= _allLoaders.Length - 1)
            {
                return _allLoaders[id];
            }

            return "loader.gif";

        }

    
    }
}