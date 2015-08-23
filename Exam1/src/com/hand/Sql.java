package com.hand;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class Sql {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.print("请输入Customer ID:");
		int customerid = scan.nextInt();
		String sql1 = "select first_name,last_name from customer where customer_id='" + customerid + "'";
		// String sql2= "select film.title,film.film_id from film where
		// customer_id='"+customerid+"'and store_id=inventory.store_id and
		// inventory.film_id=film.film_id ";
		String sql3 = "select rental_date from rental where customer_id='" + customerid + "'";
		Connection conn = null;
		Statement st = null;
		ResultSet rs1 = null;
		// ResultSet rs2 = null;
		ResultSet rs3 = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sakila", "root", "admin");
			st = conn.createStatement();
			rs1 = st.executeQuery(sql1);
			while (rs1.next()) {
				System.out.println(rs1.getString("first_name") + "." + rs1.getString("last_name") + "租用的Film->");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		/*
		 * try {
		 * 
		 * rs2 = st.executeQuery(sql2); while (rs2.next()) {
		 * System.out.println(rs2.getString("title")); } } catch (Exception e) {
		 * e.printStackTrace(); }
		 */
		try {

			rs3 = st.executeQuery(sql3);
			System.out.println("Film ID" + "|" + "Film 名稱" + "|" + "租用時間");
			while (rs3.next()) {

				System.out.print(rs3.getInt("rental_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			rs3.close(); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			rs1.close(); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			st.close(); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			conn.close(); 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
