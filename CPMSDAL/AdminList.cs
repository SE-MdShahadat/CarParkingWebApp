using CPMSCommon;
using CPMSDBModel.Admin;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CPMSDAL
{
    public class AdminList
    {
        public int SaveAdmin(AdminDBModel _dbModel)
        {
            SqlConnection conn = new SqlConnection(DBConnection.GetConnection());
            conn.Open();
            SqlCommand dCmd = new SqlCommand("SP_SET_TBL_ADMIN", conn);
            dCmd.CommandType = CommandType.StoredProcedure;
            try
            {
                dCmd.Parameters.AddWithValue("@AdminID", _dbModel.AdminID);
                dCmd.Parameters.AddWithValue("@Name", _dbModel.Name);
                dCmd.Parameters.AddWithValue("@Contact", _dbModel.Contact);
                dCmd.Parameters.AddWithValue("@Address", _dbModel.Address);
                dCmd.Parameters.AddWithValue("@AddedBy", 9);
                if (_dbModel.AdminID > 0)
                    dCmd.Parameters.AddWithValue("@QryOption", 2);
                else
                    dCmd.Parameters.AddWithValue("@QryOption", 1);
                return dCmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                //UtilityOptions.ErrorLog(ex.ToString(), MethodBase.GetCurrentMethod().Name);
                throw ex;
            }
            finally
            {
                dCmd.Dispose();
                conn.Close();
                conn.Dispose();
            }
        }
        public List<AdminDBModel> LoadAllAdmin()
        {
            List<AdminDBModel> _modelList = new List<AdminDBModel>();
            SqlConnection conn = new SqlConnection(DBConnection.GetConnection());
            conn.Open();
            SqlCommand dAd = new SqlCommand("SP_SET_TBL_ADMIN", conn);
            SqlDataAdapter sda = new SqlDataAdapter(dAd);
            dAd.CommandType = CommandType.StoredProcedure;
            dAd.Parameters.AddWithValue("@QryOption", 3);
            DataTable dt = new DataTable();
            try
            {
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    _modelList = (from DataRow row in dt.Rows
                                  select new AdminDBModel
                                  {
                                      AdminID = Convert.ToInt32(row["AdminID"].ToString()),
                                      Name = row["Name"].ToString(),
                                      Contact = row["Contact"].ToString(),
                                      Address = row["Address"].ToString(),
                                  }).ToList();
                }
                return _modelList;
            }
            catch (Exception ex)
            {
                //UtilityOptions.ErrorLog(ex.ToString(), MethodBase.GetCurrentMethod().Name);
                throw ex;
            }
            finally
            {
                dt.Dispose();
                dAd.Dispose();
                conn.Close();
                conn.Dispose();
            }
        }
        public int DeleteAdmin(AdminDBModel _dbModel)
        {
            SqlConnection conn = new SqlConnection(DBConnection.GetConnection());
            conn.Open();
            SqlCommand dCmd = new SqlCommand("SP_SET_TBL_ADMIN", conn);
            dCmd.CommandType = CommandType.StoredProcedure;
            try
            {
                dCmd.Parameters.AddWithValue("@AdminID", _dbModel.AdminID);
                dCmd.Parameters.AddWithValue("@QryOption", 5);
                return dCmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                //UtilityOptions.ErrorLog(ex.ToString(), MethodBase.GetCurrentMethod().Name);
                throw ex;
            }
            finally
            {
                dCmd.Dispose();
                conn.Close();
                conn.Dispose();
            }
        }
        public List<AdminDBModel> LoadSelectedAdmin(AdminDBModel _dbModel)
        {
            List<AdminDBModel> _modelList = new List<AdminDBModel>();
            SqlConnection conn = new SqlConnection(DBConnection.GetConnection());
            conn.Open();
            SqlCommand dAd = new SqlCommand("SP_SET_TBL_ADMIN", conn);
            SqlDataAdapter sda = new SqlDataAdapter(dAd);
            dAd.CommandType = CommandType.StoredProcedure;
            dAd.Parameters.AddWithValue("AdminID", _dbModel.AdminID);
            dAd.Parameters.AddWithValue("@QryOption", 4);
            DataTable dt = new DataTable();
            try
            {
                sda.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    _modelList = (from DataRow row in dt.Rows
                                  select new AdminDBModel
                                  {
                                      AdminID = Convert.ToInt32(row["AdminID"].ToString()),
                                      Name = row["Name"].ToString(),
                                      Contact = row["Contact"].ToString(),
                                      Address = row["Address"].ToString(),
                                  }).ToList();
                }
                return _modelList;
            }
            catch (Exception ex)
            {
                //UtilityOptions.ErrorLog(ex.ToString(), MethodBase.GetCurrentMethod().Name);
                throw ex;
            }
            finally
            {
                dt.Dispose();
                dAd.Dispose();
                conn.Close();
                conn.Dispose();
            }
        }
    }
}
