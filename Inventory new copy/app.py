from flask import Flask,render_template,request,redirect,session
from flaskext.mysql import MySQL

import emoji
import re
from sendgrid import SendGridAPIClient
from sendgrid.helpers.mail import Mail
mysql = MySQL()


app = Flask(__name__)
app.secret_key="hello"
app.config['MYSQL_DATABASE_USER']='QF53HUUBsI'
app.config['MYSQL_DATABASE_PASSWORD']='qPbAANR3I3'
app.config['MYSQL_DATABASE_DB']='QF53HUUBsI'
app.config['MYSQL_DATABASE_HOST']='remotemysql.com'

mysql.init_app(app)
@app.route('/')
def root():
   return redirect('/home')


@app.route("/home")
def home():
    return render_template('home.html')



@app.route("/admin",methods=['GET','POST'])
def admin():
    global regid
    msg = ''
   
  
    if request.method == 'POST' :
        username1=request.form['username']
        session['username']  = username1
        password=request.form['password']
        conn=mysql.connect()
        cur=conn.cursor()
       
        
        cur.execute("select `email` from `adminregister` WHERE `name`=%s",(username1))
        data=cur.fetchall()
        email= data[0][0]
        
        session['email']=email
        
        print (account)
        if account:
            session['loggedin'] = True
            session['id'] = account[0]
            regid=  account[0]
            session['username'] = account[1]
            msg = 'Logged in successfully !'
            
            msg = 'Logged in successfully !'
            return redirect('/view')
        else:
            msg = 'Incorrect username/password!try again....'
    return render_template('admin.html', msg = msg)

    
@app.route("/adminregister",methods=['GET','POST'])

def adminregister():
    msg = ''
    if request.method == 'POST' :
        username1=request.form['fname']
        password1=request.form['pass']
        EmailID=request.form['emailid']
        session['username']  = username1
        session['email']  = EmailID
        conn=mysql.connect()
        cur=conn.cursor()
        cur.execute('SELECT * FROM adminregister WHERE name = % s', (username1, ))
        account = cur.fetchone()
        print(account)
        if account:
            msg = 'User already exists!You can directly login....'
        elif not re.match(r'[^@]+@[^@]+\.[^@]+', EmailID):
            msg = 'Invalid email address !'
        elif not re.match(r'[A-Za-z0-9]+', username1):
            msg = 'name must contain only characters and numbers !'
        else:
           
            msg = 'You have successfully registered !'
            return redirect('/view')
            
    elif request.method == 'POST':
        msg = 'Please fill out the form !'
    return render_template('adminregister.html', msg = msg)

@app.route("/add",methods=['GET','POST'])
def add():
    if request.method=="POST":
        un=request.form['un']
        pn=request.form['pn']
        pd=request.form['pd']
        pr=request.form['pr']
        pq=request.form['pq']
        location=request.form['lo']
        unit=request.form['unit']
        session['username']  = un
        conn=mysql.connect()
        cur=conn.cursor()
        
        
        return redirect('view')

    else:
        
        return render_template('view.html')
        

@app.route("/userbuy",methods=['GET','POST'])
def userbuy():
    conn=mysql.connect()
    cur=conn.cursor()
    cur.execute("SELECT `productid`, `productname`, `productdesc`, `price`, `units`, `avlqty` FROM `product` where username=%s" ,(session['username'],))
    data=cur.fetchall()
    
    return render_template('userbuy.html',data=data)

@app.route("/buy")
def buy():
    conn=mysql.connect()
    cur=conn.cursor()
    cur.execute("select * from userbuy")
    data=cur.fetchall()

    return render_template('buy.html',data=data)


@app.route("/edit",methods=['GET','POST'])
def edit():
    if request.method=="POST":
        
        id=request.form['id']
        productname=request.form['productname']
        productdesc=request.form['productdesc']
        price=request.form['price']
        avlqty=request.form['qty']
        unit=request.form['unit']

        conn=mysql.connect()
        cur=conn.cursor()
        
        return redirect('view')
    else:
        id=request.args.get('id')
        conn=mysql.connect()
        cur=conn.cursor()
        cur.execute("select * from product where `productid`='"+str(id)+"'")
        data=cur.fetchone()
        return render_template('edit.html',product=data)



@app.route("/editcart",methods=['GET','POST'])
def editcart():
        if request.method=="POST":
            id=request.form['id']
            productname=request.form['productname']
            productdesc=request.form['productdesc']
            price=request.form['price']
            
            qty=request.form['qty']
            
            conn=mysql.connect()
            cur=conn.cursor()
           
            data=cur.fetchall()
    
            try:
            
                if float(qty)>float(data[0][0]):
                    return "not available"
       
                elif float(qty)<float(data[0][0]):
                  
                   price=request.form['price']
                   qty=request.form['qty']
                   total=str(float(price)*float(qty))
    
               
                   resu=str(float(data[0][0])-float(qty))
                   
                   
                   
                   cur.execute("UPDATE `product` SET `avlqty`='"+resu+"' WHERE `productid`=%s",(id))
                   conn.commit()
                   
                   return redirect('cart')
                else:
                    price=request.form['price']
                    qty=request.form['qty']
                    total=str(float(price)*float(qty))
                    
                    
                    resu=str(float(data[0][0])-float(qty))
                   
                    cur.execute("UPDATE `product` SET `avlqty`='"+resu+"' WHERE `productid`=%s",(id))
                    conn.commit()
                    return redirect('cart')
                    
    
                    
            except Exception as e:
                    return emoji.emojize('please enter valid number:pouting_face:')
           
         
            

        else:
            
            id=request.args.get('id')
            conn=mysql.connect()
            cur=conn.cursor()
           
            cur.execute("SELECT `name` FROM `adminregister` where name=%s" ,(session['username'],))
            name=cur.fetchall()
    
    
    
            conn.commit()
            return render_template('editcart.html',product=data,name=name)
        
        
@app.route("/shipping",methods=['GET','POST'])
def shipping():
 
            conn=mysql.connect()
            cur=conn.cursor()
           
            cur.execute(" select sum(total) from cart")
            grand=cur.fetchall()
            threshold=10.0
            if float(grand[0][0])>=threshold:
               
                from flask import session
             data=cur.fetchall()
                
                
                length=int(len(data))
                for i in range(length):
                    if float(data[i][0])==0:
                        
                        message = Mail(
                            from_email='arpitaprakashhegde@gmail.com',
                            to_emails=session['email'],
                            subject='Alert to retailers',
                            html_content="Dear customer,"+"check your inventory  account :"+" It seems one or more product "+"no longer available in your store please reorder your stock inorder to experiance good customer base "+"for more information click the link below  "+"http://arpitaprakashhegdeinventoryapp.apps.pcfdev.in/mail")
                        try:
                            sg = SendGridAPIClient('')
                            response = sg.send(message)
                            print(response.status_code)
                            print(response.body)
                            print(response.headers)
                        except Exception as e:
                            print(e.message)
                        length=length-1
                        return redirect('thank')
                return redirect('thank')
            
                
            
            else:
                return "cart cost must be greater then 10 for shipping"
  

@app.route("/delete",methods=['GET','POST'])
def delete():
    id=request.args.get('id')
    conn=mysql.connect()
    cur=conn.cursor()
    cur.execute("DELETE FROM `product` WHERE `productid`='"+id+"'")
    conn.commit()
    return redirect('view')

@app.route("/deletecart",methods=['GET','POST'])
def deletecart():
    id=request.args.get('id')
    conn=mysql.connect()
    cur=conn.cursor()
   
   
    cur.execute("select `avlqty` from `cart` WHERE `productid`=%s",(id))
    data1=cur.fetchall()
    cur.execute("DELETE FROM `cart` WHERE `productid`='"+id+"'")
    conn.commit()
    
    result=str(float(data[0][0])+float(data1[0][0]))
    cur.execute("UPDATE `product` SET `avlqty`='"+result+"' WHERE `productid`=%s",(id))
               

    conn.commit()
    
    
    
   
    return redirect('cart')
    

@app.route("/deletetrack",methods=['GET','POST'])
def deletetrack():
    id=request.args.get('id')
    conn=mysql.connect()
    cur=conn.cursor()
   
   
    cur.execute("DELETE FROM `track` WHERE `productid`='"+id+"'")
    conn.commit()
 
    return redirect('track')
    
   
   

@app.route("/view",methods=['GET','POST'])
def view():
    conn=mysql.connect()
    cur=conn.cursor()
    
    
    cur.execute("SELECT `name` FROM `adminregister` where name=%s" ,(session['username'],))
    name=cur.fetchall()
    
    
    
    return render_template('view.html',data=data,name=name)


@app.route("/track",methods=['GET','POST'])
def track():
    conn=mysql.connect()
    cur=conn.cursor()
    cur.execute("SELECT * from track where username=%s" ,(session['username'],) )
    data=cur.fetchall()

    return render_template('track.html',data=data)

@app.route("/cart")
def cart():
    
    conn=mysql.connect()
    cur=conn.cursor()
    cur.execute("SELECT * from cart where username=%s" ,(session['username'],))
    data=cur.fetchall()
  
   
    conn.commit()
 

    return render_template('cart.html',data=data)
@app.route("/mail")
def mail():
    conn=mysql.connect()
    cur=conn.cursor()
   
   
  
    conn.commit()

    return render_template('mail.html',data=data)


@app.route("/total")
def total():
    conn=mysql.connect()
    cur=conn.cursor()
    from flask import session
    cur.execute(" select sum(total) from cart where username=%s",(session['username'],))
    data=cur.fetchall()   
    conn.commit()
    return render_template('shipping.html',data=data)


@app.route("/tracktotal",methods=['GET','POST'])
def tracktotal():
    if request.method=="POST":
        conn=mysql.connect()
        cur=conn.cursor()
        date=request.form['date']
        cur.execute(" select  sum(total),sum(qty) from track where username=%s",(session['username'],))
        data=cur.fetchall()
        cur.execute("select `username` from product where username=%s",(session['username'],))
        abc=cur.fetchall()
    
        session['username']=abc[0][0]
        
        
        return render_template('tracktotal.html',data=data)
        
        
    else:
        return render_template('tracktotal.html',data=data)



@app.route("/stock")
def stock():
    conn=mysql.connect()
    cur=conn.cursor()
    

    return render_template('stock.html',data=data)



@app.route("/help")
def help():
    return render_template('help.html')

@app.route("/thank")
def thank():
    conn=mysql.connect()
    cur=conn.cursor()

    cur.execute("delete from cart where username=%s" ,(session['username'],))
    conn.commit()
    return render_template('thank.html')
    
@app.route("/history")
def history():
    conn=mysql.connect()
    cur=conn.cursor()
    
   
    conn.commit()      
  
    return render_template('history.html',data=data)
@app.route("/clearhistory")
def clearhistory():
    conn=mysql.connect()
    cur=conn.cursor()
    
       conn.commit()      
 
    
    return render_template('history.html',data=data)
@app.route("/logout")
def logout():
    conn=mysql.connect()
    cur=conn.cursor()
    
    conn.commit()
    session.pop("username",None)
 
    return render_template('home.html')

if __name__=="__main__":
    app.run(host='0.0.0.0',debug = True,port=8080)
