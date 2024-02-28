### Latihan Mandiri: Eksplorasi Mekanika Pergerakan

#### Controls:
- left: **`Left, A`**
- right: **`Right, D`**
- jump: **`Space, W, Up`**
- crouch: **`S, Ctrl, C, Down`**
- double jump: **`jump x2`**
- dashing: **`left x2, right x2`**

#### Double jump
<p>Menggunakan counter untuk mengetahui sedang pada loncatan keberapa. Ketika dibawah max-nya yaitu 2 maka masih bisa loncat, tetapi jika >=2 maka tidak bisa loncat 
lagi. Jika pemain berada di lantai maka counter akan direset ke 0.</p>

#### Dashing
<p>Menggunakan counter juga seperti double jump yang juga perlu untuk cek posisi counter-nya. Bedanya adalah perlu variabel dashing supaya tahu jika sedang dash 
karena button-nya overlap dengan movement. Untuk loop pertama, jika pemain pencet sekali button, maka counter akan naik 1. Jika setelah timeout yang ditentukan 
pemain tidak memencet button-nya lagi maka counter akan direset. Jika counter sudah sesuai dengan nilai yang diinginkan maka variabel dashing akan diset true dan
velocity pada bidang X dinaikkan. Setelah timeout singkat, kecepatan akan kembali seperti sebelumnya yaitu 400 (karena terdapat velocity.x = 0 setiap get_input dan 
kecepatan movement 400). Lalu buat kode serupa untuk arah sebaliknya supaya dash-nya terhitung sendiri-sendiri untuk setiap arah.</p>

#### Crouching
<p>Mengganti animation player ke "crouch" dengan cara play animation tersebut, melakukan velocity.y += 5 supaya tidak sama dengan kondisi idle dan terasa lebih 
berat, dan velocity.x /= 2 untuk mengurangi kecepatan movement.</p>

#### Referensi:
- https://www.reddit.com/r/godot/comments/lx1eol/need_help_with_double_jump_code/
- https://forum.godotengine.org/t/is-on-floor-not-working-properly/18735
- https://www.youtube.com/watch?v=SN9sOBr3Mp4
- https://www.youtube.com/watch?v=uUTEeriHd_w
- https://www.makeuseof.com/2d-animation-godot-using-animatedsprite/
- https://godotforums.org/d/20957-double-tap-press-to-dash-help
- https://docs.godotengine.org/en/3.6/tutorials/2d/2d_sprite_animation.html
- https://docs.godotengine.org/en/3.5/classes/class_animatedsprite.html