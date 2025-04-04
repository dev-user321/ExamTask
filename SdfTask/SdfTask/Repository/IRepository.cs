using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SdfTask.Repository
{
    internal interface IRepository<T>
    {
        void Add(T t);
        void Update(int id, T t);
        void Delete(int id);
        List<T> GetAll();
        T GetById(int id);
    }
}
