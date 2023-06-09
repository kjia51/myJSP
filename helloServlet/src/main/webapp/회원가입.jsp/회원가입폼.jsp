<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>    <style>
        *{
            margin: 0 auto;
        }
        table, tr, th{
            border: 1px solid black;
        }
        #td5{
            text-align: center;
        }
        #th1{
            width: 100px;
            height: 30px;
        }
        textarea{
            width: 97%;
        }
        h3{
            margin-left: 400px;
            display: inline-block;
        }
        optgroup{
            width: 50px;
        }
        #btn{
            margin-bottom: 10px;
            display: inline-block;
        }
        .hidden{
            display: none;
        }
        /* 버튼은 기본값이 inline  */

    </style>
</head>

<body>
    <h3>회원가입폼</h3>
    <button id='btn'>폼 작성</button>
    <form method="post" action="login.jsp">
    <table id='tb1' class='hidden'>
        <tr>
            <th id='th1'><label for="id">ID</label></th>
            <td><input type="text" name="id" required ></td>
            <td><button type="submit">중복확인</button></td>
            <td><input type="checkbox">아이디저장</td>
        </tr>
        <tr>
            <th><label for="password">비밀번호</label></th>
            <td><input type="text" name="password" required></td>
        </tr>
        <tr>
            <th><label for="name">성명</label></th>
            <td><input type="text" required></td>
        </tr>
        <tr>
            <th><label for="email">Email</label></th>
            <td><input type="text" required>@</td>
            <td><input type="text" required></td>
            <td>
                <select name='emailAddr' id='emailAddr' required>
                    <!-- <optgroup> -->
                        <option value="" label='직접입력'>직접입력</option>
                        <option value="naver.com">네이버</option>
                        <option value="goolge.com">구글</option>
                    <!-- </optgroup> -->
                </select>
                </td>
        </tr>
        <tr>
            <th><label for="phone">핸드폰</label></th>
            <td id='td5'>
                <select name='phone' id='phone' required>
                    <option value="" label='번호선택'>번호선택</option>
                    <!-- <optgroup label='번호' width='50px'> -->
                        <option value="010">010</option>
                        <option value="010">011</option>
                        <option value="010">019</option>
                        <option value="070">070</option>
                    <!-- </optgroup> -->
                </select>
            </td>
            <td><input type="phone" required>-</td>
            <td><input type="phone" required></td>
        </tr>
        <tr>
            <th><label for="gender">성별</label></th>
            <td colspan='3'>
                <fieldset>
                    <input type="radio" name='gender' value='M'>남자
                    <input type="radio" name='gender' value='F'>여자
                </fieldset>
            </td>
        </tr>
        <tr>
            <th><label for="hobby">취미</label></th>
            <td colspan='3'>
                <fieldset>
                    <input type="checkbox" name ='hobby' value='공부'> 공부
                    <input type="checkbox" name ='hobby' value='등산'> 등산
                    <input type="checkbox" name ='hobby' value='게임'> 게임
                    <input type="checkbox" name ='hobby' value='낚시'> 낚시
                    <input type="checkbox" name ='hobby' value='쇼핑' > 쇼핑
                </fieldset>
            </td>
        </tr>
        <tr>
            <th><label for="text">자기소개</label></th>
            <td colspan='3'>
                <textarea type="motive" cols='60' rows='6'>자기소개를 100자 이내로 입력하세요</textarea> 
            </td>
        </tr>
        <tr>
            <td align='center' colspan='4'>
                <button type="submit" id='submit'>회원가입</button>
                <button type="reset" id='reset'>취소</button>
            </td>
        </tr>
    </table>
    </form>
    <script>
        window.onload = function(){
            submit.addEventListener('click',function(){
                // <optgroup>
                //         <option value="etc" label='직접입력'>직접입력</option>
                //         <option value="naver.com">네이버</option>
                //         <option value="goolge.com">구글</option>
                //     </optgroup>
                let count;
                let option = document.querySelectorAll('#emailAddr option');
                count = 0;
                
                // for(let i=1; i<option.length; i++){
                //     if(option[i].required){
                //         count++;
                //     }
                // }
                // if(count<1){
                //     alert('핸드폰 앞자리를 선택하세요');
                // }

                let radio = document.querySelectorAll('input[type="radio"]');
                count = 0;
                for(let i=0; i<radio.length; i++){
                    if(radio[i].checked){
                        count++;
                    }
                }
                if(count<1){
                    alert('성별을 선택하세요');
                }

                
                let checkbox = document.querySelectorAll('input[type="checkbox"]');
                count = 0;
                for(let i=0; i<checkbox.length; i++){
                    if(checkbox[i].checked){
                        count++;
                    }
                }
                if(count<2){
                    alert('취미는 2개 이상 선택 가능합니다');
                }
                let motive = document.querySelector('textarea').value;
                if(motive.length>=100){
                    alert('자기소개를 100자 이내로 입력하세요');
                }
            });
            btn.addEventListener('click',function(){
                tb1.classList.toggle('hidden');
        });
        reset.addEventListener('click',function(){
            let input = document.getElementsByTagName('input')
            for(let i of input){
                i.value='';
            }
        });
    }
    </script>
</body>
</html>