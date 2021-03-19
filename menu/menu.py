from flask import Flask, render_template, request,session,redirect,url_for

app = Flask(__name__)
app.secret_key=b'1234'

import mysql 
import mysql.connector
import glob

dbconfig={'host':'localhost','user':'root','password':'','database':'burger'}
conn=mysql.connector.connect(**dbconfig)
cursor=conn.cursor()

images=glob.glob('D:\menu\static\image/*.jpg')

image_path=[]

cnt=0
for fname in images:
    fname=images[cnt][15:]
    fname=fname.replace("\\","/")
    cnt+=1
    image_path.append(fname)



"""
path=i.replace("\\","/") #문자열치환
"""



@app.route('/')
def home()->'html':
    SQL="SELECT *FROM menu"
    cursor.execute(SQL)
    data=cursor.fetchall()
    dlen=len(data)//2
    data1=data[:dlen]
    data2=data[dlen:]
    

    image_list=[]
    ct=0
    for i in image_path:
        image_file=url_for('static',filename=image_path[ct])
        image_list.append(image_file)
        ct+=1

    image_len=len(image_list)//2
    ilist1=image_list[:image_len]
    ilist2=image_list[image_len:]

    return render_template("index.html",data1=data1,data2=data2,ilist1=ilist1,ilist2=ilist2)

@app.route('/test/')
def test()->'html':
    image_list=[]
    ct=0
    for i in image_path:
        image_file=url_for('static',filename=image_path[ct])
        image_list.append(image_file)
        ct+=1
    

    return render_template('test.html',image_list=image_list)

@app.route('/burger/')
def show_burger()->'html':
    SQL="SELECT *FROM menu"
    cursor.execute(SQL)
    data=cursor.fetchall()
    dlen=len(data)//2
    data1=data[:dlen]
    data2=data[dlen:]
    
    image_list=[]
    ct=0
    for i in image_path:
        image_file=url_for('static',filename=image_path[ct])
        image_list.append(image_file)
        ct+=1

    image_len=len(image_list)//2
    ilist1=image_list[:image_len]
    ilist2=image_list[image_len:]


    return render_template("burger.html",data1=data1,data2=data2,ilist1=ilist1,ilist2=ilist2)

@app.route('/drink/')
def show_drink()->'html':
    SQL="SELECT *FROM beverage"
    cursor.execute(SQL)
    data=cursor.fetchall()
    dlen=len(data)//2
    data1=data[:dlen]
    data2=data[dlen:]
    
    return render_template("drink.html",data1=data1,data2=data2)

@app.route('/product_info/',methods=["GET"])
def info()->'html':
    name=request.args.get('no')
    SQL="SELECT *FROM menu WHERE burger_name=%s"
    SQL2="SELECT *FROM beverage WHERE be_name=%s"
    cursor.execute(SQL,(name,))
    data=cursor.fetchall()

    index=data[0][0]
    image_file=url_for('static',filename=image_path[index-1])

    if len(data)==0:
        cursor.execute(SQL2,(name,))
        data=cursor.fetchall()
        return render_template("product_drink.html",data=data,image_file=image_file)

    return render_template("product.html",data=data,image_file=image_file)

@app.route('/search/',methods=["POST"])
def search()->'html':
    se=request.form["res"]
    SQL="SELECT *FROM menu WHERE burger_name LIKE  %s "
    args=['%'+se+'%'] # %를 붙여주기위함
    cursor.execute(SQL,args)
    data=cursor.fetchall()

    if len(data)==0:

        SQL2="SELECT *FROM beverage WHERE be_name LIKE %s"
        args=['%'+se+'%']
        cursor.execute(SQL2,args)
        data=cursor.fetchall()

        if len(data)==0:
            print("검색된 데이터 없음")
            data="검색된 데이터없음"
            return render_template("search.html",data=data)

        return render_template("search.html",data=data)

    list_index=[]
    i=0
    for c in data:
        idx=data[i][0]
        list_index.append(idx)
        i+=1

    i_list=[]

    for i in list_index:
        i_file=url_for('static',filename=image_path[i-1])
        i_list.append(i_file)
        i+=1

    print(i_list)
    #index=data[0][0]
    #image_file=url_for('static',filename=image_path[index-1])
    return render_template("search.html",data=data,image_file=i_list)
app.run(debug=True)