from flask import Flask, render_template, request, redirect, url_for, flash
from flask_mysqldb import MySQL

app = Flask(__name__)
app.secret_key = 'many random bytes'

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'clinicmanagementsystem'

mysql = MySQL(app)


# ==============================================================================
# 1. DEPARTMENTS ROUTES
# ==============================================================================
@app.route('/')
def Index():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM Department")
    data = cur.fetchall()
    cur.close()
    return render_template('index2.html', department=data)


@app.route('/insert', methods=['POST'])
def insert():
    if request.method == "POST":
        Name = request.form['Name']
        Description = request.form['Description']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO Department (Name, Description) VALUES (%s, %s)", (Name, Description))
        mysql.connection.commit()
        flash("Department Inserted Successfully")
        return redirect(url_for('Index'))


@app.route('/delete/<string:id_data>', methods=['GET'])
def delete(id_data):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM Department WHERE Department_ID=%s", (id_data,))
    mysql.connection.commit()
    flash("Department Record Has Been Deleted Successfully")
    return redirect(url_for('Index'))


@app.route('/update', methods=['POST', 'GET'])
def update():
    if request.method == 'POST':
        Department_ID = request.form['Department_ID']
        Name = request.form['Name']
        Description = request.form['Description']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE Department SET Name=%s, Description=%s WHERE Department_ID=%s",
                    (Name, Description, Department_ID))
        mysql.connection.commit()
        flash("Department Data Updated Successfully")
        return redirect(url_for('Index'))


# ==============================================================================
# 2. CLINICS ROUTES
# ==============================================================================
@app.route('/clinics')
def clinics():
    cur = mysql.connection.cursor()
    # Left join to show the Department Name instead of just an ID number
    cur.execute("""
        SELECT c.Clinic_ID, c.Name, c.Address, d.Name, c.Department_ID 
        FROM Clinic c 
        LEFT JOIN Department d ON c.Department_ID = d.Department_ID
    """)
    clinic_data = cur.fetchall()

    # Fetch departments list to populate dropdown selections inside Add/Edit modals
    cur.execute("SELECT Department_ID, Name FROM Department")
    dept_data = cur.fetchall()
    cur.close()
    return render_template('clinics.html', clinics=clinic_data, departments=dept_data)


@app.route('/clinic/insert', methods=['POST'])
def clinic_insert():
    if request.method == "POST":
        Clinic_ID = request.form['Clinic_ID']
        Name = request.form['Name']
        Address = request.form['Address']
        Department_ID = request.form['Department_ID']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO Clinic (Clinic_ID, Name, Address, Department_ID) VALUES (%s, %s, %s, %s)",
                    (Clinic_ID, Name, Address, Department_ID))
        mysql.connection.commit()
        flash("Clinic Facility Registered Successfully")
        return redirect(url_for('clinics'))


@app.route('/clinic/update', methods=['POST'])
def clinic_update():
    if request.method == 'POST':
        Clinic_ID = request.form['Clinic_ID']
        Name = request.form['Name']
        Address = request.form['Address']
        Department_ID = request.form['Department_ID']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE Clinic SET Name=%s, Address=%s, Department_ID=%s WHERE Clinic_ID=%s",
                    (Name, Address, Department_ID, Clinic_ID))
        mysql.connection.commit()
        flash("Clinic Data Modified Successfully")
        return redirect(url_for('clinics'))


@app.route('/clinic/delete/<string:id_data>', methods=['GET'])
def clinic_delete(id_data):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM Clinic WHERE Clinic_ID=%s", (id_data,))
    mysql.connection.commit()
    flash("Clinic Facility Removed Successfully")
    return redirect(url_for('clinics'))


# ==============================================================================
# 3. DOCTORS ROUTES
# ==============================================================================
@app.route('/doctors')
def doctors():
    cur = mysql.connection.cursor()
    cur.execute("""
        SELECT d.Doctor_ID, d.Name, d.Phone_Number, d.Address, dept.Name, d.Department_ID 
        FROM Doctor d 
        LEFT JOIN Department dept ON d.Department_ID = dept.Department_ID
    """)
    doc_data = cur.fetchall()

    cur.execute("SELECT Department_ID, Name FROM Department")
    dept_data = cur.fetchall()
    cur.close()
    return render_template('doctors.html', doctors=doc_data, departments=dept_data)


@app.route('/doctor/insert', methods=['POST'])
def doctor_insert():
    if request.method == "POST":
        Doctor_ID = request.form['Doctor_ID']
        Name = request.form['Name']
        Phone = request.form['Phone_Number']
        Address = request.form['Address']
        Department_ID = request.form['Department_ID']
        cur = mysql.connection.cursor()
        cur.execute(
            "INSERT INTO Doctor (Doctor_ID, Name, Phone_Number, Address, Department_ID) VALUES (%s, %s, %s, %s, %s)",
            (Doctor_ID, Name, Phone, Address, Department_ID))
        mysql.connection.commit()
        flash("Doctor Staff Assigned Successfully")
        return redirect(url_for('doctors'))


@app.route('/doctor/update', methods=['POST'])
def doctor_update():
    if request.method == 'POST':
        Doctor_ID = request.form['Doctor_ID']
        Name = request.form['Name']
        Phone = request.form['Phone_Number']
        Address = request.form['Address']
        Department_ID = request.form['Department_ID']
        cur = mysql.connection.cursor()
        cur.execute("UPDATE Doctor SET Name=%s, Phone_Number=%s, Address=%s, Department_ID=%s WHERE Doctor_ID=%s",
                    (Name, Phone, Address, Department_ID, Doctor_ID))
        mysql.connection.commit()
        flash("Medical Professional Record Updated")
        return redirect(url_for('doctors'))


@app.route('/doctor/delete/<string:id_data>', methods=['GET'])
def doctor_delete(id_data):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM Doctor WHERE Doctor_ID=%s", (id_data,))
    mysql.connection.commit()
    flash("Doctor Record Purged Successfully")
    return redirect(url_for('doctors'))


# ==============================================================================
# 4. PATIENTS ROUTES
# ==============================================================================
@app.route('/patients')
def patients():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM Patient")
    patient_data = cur.fetchall()
    cur.close()
    return render_template('patients.html', patients=patient_data)


@app.route('/patient/insert', methods=['POST'])
def patient_insert():
    if request.method == "POST":
        Patient_ID = request.form['Patient_ID']
        Name = request.form['Name']
        Phone = request.form['Phone_Number']
        Address = request.form['Address']
        Birth_Date = request.form['Birth_Date']
        Job = request.form['Job']
        cur = mysql.connection.cursor()
        cur.execute(
            "INSERT INTO Patient (Patient_ID, Name, Phone_Number, Address, Birth_Date, Job) VALUES (%s, %s, %s, %s, %s, %s)",
            (Patient_ID, Name, Phone, Address, Birth_Date, Job))
        mysql.connection.commit()
        flash("Patient File Registered Successfully")
        return redirect(url_for('patients'))


@app.route('/patient/update', methods=['POST'])
def patient_update():
    if request.method == 'POST':
        Patient_ID = request.form['Patient_ID']
        Name = request.form['Name']
        Phone = request.form['Phone_Number']
        Address = request.form['Address']
        Birth_Date = request.form['Birth_Date']
        Job = request.form['Job']
        cur = mysql.connection.cursor()
        cur.execute(
            "UPDATE Patient SET Name=%s, Phone_Number=%s, Address=%s, Birth_Date=%s, Job=%s WHERE Patient_ID=%s",
            (Name, Phone, Address, Birth_Date, Job, Patient_ID))
        mysql.connection.commit()
        flash("Patient Profile File Changes Written Successfully")
        return redirect(url_for('patients'))


@app.route('/patient/delete/<string:id_data>', methods=['GET'])
def patient_delete(id_data):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM Patient WHERE Patient_ID=%s", (id_data,))
    mysql.connection.commit()
    flash("Patient System Records Cleared")
    return redirect(url_for('patients'))


# ==============================================================================
# 5. APPOINTMENTS SCHEDULE MONITOR VIEW
# ==============================================================================
@app.route('/appointments')
def appointments():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM View_UpcomingAppointments")
    appointment_data = cur.fetchall()
    cur.close()
    return render_template('appointments.html', appointments=appointment_data)


if __name__ == "__main__":
    app.run(debug=True)