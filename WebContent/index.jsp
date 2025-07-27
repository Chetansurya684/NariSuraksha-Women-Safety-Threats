<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>NariSuraksha - Women's Safety Platform</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Comfortaa:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
    :root {
        --primary: #ff6b6b;
        --primary-light: #ff8e8e;
        --primary-dark: #ff4757;
        --secondary: #6c5ce7;
        --light: #f8f9fa;
        --dark: #1a1a2e;
        --success: #00b894;
        --info: #0984e3;
        --warning: #fdcb6e;
        --danger: #e84393;
    }
    
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body {
        font-family: 'Poppins', sans-serif;
        min-height: 100vh;
        background: linear-gradient(135deg, 
                      rgba(255, 107, 107, 0.15), 
                      rgba(108, 92, 231, 0.15)),
                    url('https://images.unsplash.com/photo-1496080174650-637e3f22fa09?ixlib=rb-1.2.1&auto=format&fit=crop&w=1920&q=80') no-repeat center center/cover;
        color: var(--dark);
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        overflow-x: hidden;
        position: relative;
    }

    /* Floating Social Messages Background */
    .message-background {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        overflow: hidden;
        z-index: -1;
    }

    .floating-message {
        position: absolute;
        background: rgba(255, 255, 255, 0.85);
        border-radius: 10px;
        padding: 15px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        max-width: 250px;
        animation: floatUp linear infinite;
        display: flex;
        align-items: center;
        gap: 10px;
        backdrop-filter: blur(3px);
    }

    .floating-message img {
        width: 40px;
        height: 40px;
        object-fit: cover;
        border-radius: 50%;
        border: 2px solid var(--primary);
    }

    .floating-message .message-content {
        font-size: 0.9rem;
        font-weight: 500;
    }

    @keyframes floatUp {
        0% {
            transform: translateY(100vh) translateX(calc(-50% + random(100) * 1%));
            opacity: 0;
        }
        10% {
            opacity: 1;
        }
        90% {
            opacity: 1;
        }
        100% {
            transform: translateY(-100px) translateX(calc(-50% + random(100) * 1%));
            opacity: 0;
        }
    }

    /* Emergency Float Button */
    .emergency-float {
        position: fixed;
        bottom: 30px;
        right: 30px;
        width: 60px;
        height: 60px;
        background: var(--danger);
        color: white;
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 1.5rem;
        box-shadow: 0 4px 20px rgba(232, 67, 147, 0.5);
        z-index: 1000;
        cursor: pointer;
        animation: pulse 1.5s infinite;
        transition: all 0.3s ease;
    }

    .emergency-panel {
        position: fixed;
        bottom: 100px;
        right: 30px;
        background: white;
        border-radius: 15px;
        padding: 20px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.15);
        z-index: 999;
        width: 300px;
        transform: translateY(20px);
        opacity: 0;
        visibility: hidden;
        transition: all 0.3s ease;
    }

    .emergency-panel.show {
        transform: translateY(0);
        opacity: 1;
        visibility: visible;
    }

    .emergency-panel h3 {
        color: var(--danger);
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .emergency-contact {
        display: flex;
        align-items: center;
        padding: 10px;
        border-radius: 8px;
        margin-bottom: 10px;
        transition: all 0.2s ease;
    }

    .emergency-contact:hover {
        background: rgba(232, 67, 147, 0.1);
    }

    .emergency-contact i {
        width: 30px;
        height: 30px;
        background: rgba(232, 67, 147, 0.2);
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        margin-right: 10px;
        color: var(--danger);
    }

    .emergency-contact span {
        font-weight: 600;
    }

    @keyframes pulse {
        0% { box-shadow: 0 0 0 0 rgba(232, 67, 147, 0.7); }
        70% { box-shadow: 0 0 0 15px rgba(232, 67, 147, 0); }
        100% { box-shadow: 0 0 0 0 rgba(232, 67, 147, 0); }
    }

    body::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: radial-gradient(circle at 20% 50%, 
                      rgba(255, 255, 255, 0.8) 0%, 
                      rgba(255, 255, 255, 0.4) 100%);
        z-index: -1;
    }

    .header {
        text-align: center;
        margin-bottom: 2rem;
        animation: fadeIn 1s ease-out;
        max-width: 800px;
        padding: 0 20px;
    }

    .header h1 {
        font-family: 'Comfortaa', cursive;
        font-size: 3.5rem;
        margin-bottom: 0.5rem;
        background: linear-gradient(to right, var(--primary), var(--secondary));
        -webkit-background-clip: text;
        background-clip: text;
        color: transparent;
        text-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }

    .header p {
        font-size: 1.2rem;
        line-height: 1.6;
        color: var(--dark);
        background: rgba(255, 255, 255, 0.7);
        padding: 15px;
        border-radius: 10px;
        backdrop-filter: blur(5px);
    }

    .welcome-message {
        position: absolute;
        top: 20px;
        left: 20px;
        background: rgba(255, 255, 255, 0.9);
        padding: 10px 15px;
        border-radius: 8px;
        font-weight: 600;
        color: var(--secondary);
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        z-index: 100;
    }

    .login-container {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 30px;
        flex-wrap: wrap;
        perspective: 1000px;
    }

    .login-box {
        background: rgba(255, 255, 255, 0.85);
        border: 1px solid rgba(255, 255, 255, 0.9);
        backdrop-filter: blur(5px);
        -webkit-backdrop-filter: blur(5px);
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        width: 300px;
        text-align: center;
        transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        position: relative;
        overflow: hidden;
    }

    .login-box::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 5px;
        background: linear-gradient(to right, var(--primary), var(--secondary));
    }

    .login-box:hover {
        transform: translateY(-8px) scale(1.02);
        box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
    }

    .login-box h2 {
        margin-bottom: 20px;
        color: var(--dark);
        font-size: 1.8rem;
        position: relative;
        display: inline-block;
        font-weight: 700;
    }

    .login-box h2::after {
        content: '';
        position: absolute;
        bottom: -8px;
        left: 50%;
        transform: translateX(-50%);
        width: 50px;
        height: 3px;
        background: linear-gradient(to right, var(--primary), var(--secondary));
        border-radius: 3px;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 12px 15px;
        margin: 12px 0;
        border: 1px solid rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        background: rgba(255, 255, 255, 0.9);
        font-family: 'Poppins', sans-serif;
        transition: all 0.3s ease;
        box-shadow: 0 2px 5px rgba(0,0,0,0.05);
    }

    input[type="text"]:focus,
    input[type="password"]:focus {
        outline: none;
        border-color: var(--primary);
        box-shadow: 0 4px 10px rgba(255, 107, 107, 0.2);
    }

    .button-group {
        display: flex;
        justify-content: center;
        gap: 10px;
        margin-top: 20px;
    }

    button, .register-link {
        padding: 12px 25px;
        cursor: pointer;
        border: none;
        border-radius: 8px;
        font-weight: 600;
        font-family: 'Poppins', sans-serif;
        transition: all 0.3s ease;
        text-decoration: none;
        display: inline-block;
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }

    button {
        background: linear-gradient(to right, var(--primary), var(--secondary));
        color: white;
    }

    button:hover {
        background: linear-gradient(to right, var(--primary-dark), var(--secondary));
        transform: translateY(-2px);
        box-shadow: 0 6px 12px rgba(0,0,0,0.15);
    }

    .register-link {
        background: white;
        color: var(--secondary);
        border: 1px solid var(--secondary);
    }

    .register-link:hover {
        background: rgba(108, 92, 231, 0.1);
        transform: translateY(-2px);
    }

    .safety-tips {
        position: fixed;
        bottom: 20px;
        left: 50%;
        transform: translateX(-50%);
        background: rgba(255, 255, 255, 0.9);
        padding: 15px 25px;
        border-radius: 50px;
        font-weight: 600;
        color: var(--danger);
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        z-index: 100;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .safety-tips i {
        font-size: 1.2rem;
        animation: pulse 1.5s infinite;
    }

    .floating-shapes {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        overflow: hidden;
        z-index: -1;
    }

    .shape {
        position: absolute;
        opacity: 0.1;
        border-radius: 50%;
        animation: float linear infinite;
    }

    .circle {
        background: var(--primary);
    }

    .triangle {
        width: 0;
        height: 0;
        border-style: solid;
        background: transparent;
    }

    .role-icon {
        font-size: 2.5rem;
        margin-bottom: 15px;
        color: var(--primary);
    }

    @media (max-width: 900px) {
        .login-container {
            flex-direction: column;
        }
        
        .header h1 {
            font-size: 2.5rem;
        }
        
        .header p {
            font-size: 1rem;
        }
        
        .login-box {
            width: 90%;
            max-width: 350px;
        }
    }

    /* Friendly animations */
    @keyframes bounceIn {
        0% { transform: scale(0.9); opacity: 0; }
        50% { transform: scale(1.05); }
        100% { transform: scale(1); opacity: 1; }
    }

    .login-box {
        animation: bounceIn 0.8s ease-out;
    }

    /* Colorful hover effects */
    .admin-box:hover {
        box-shadow: 0 15px 35px rgba(108, 92, 231, 0.2);
    }
    
    .user-box:hover {
        box-shadow: 0 15px 35px rgba(255, 107, 107, 0.2);
    }
    
    .police-box:hover {
        box-shadow: 0 15px 35px rgba(0, 184, 148, 0.2);
    }

    /* Friendly emoji decorations */
    .emoji-decoration {
        position: absolute;
        font-size: 1.5rem;
        z-index: -1;
    }

    .emoji-1 { top: 10%; left: 5%; animation: float 15s linear infinite; }
    .emoji-2 { top: 20%; right: 8%; animation: float 18s linear infinite 2s; }
    .emoji-3 { bottom: 15%; left: 10%; animation: float 20s linear infinite 3s; }
    .emoji-4 { bottom: 25%; right: 5%; animation: float 16s linear infinite 1s; }
    </style>
</head>

<body>
    <!-- Floating Messages Background -->
    <div class="message-background" id="messageBackground"></div>

    <!-- Floating Shapes Background -->
    <div class="floating-shapes">
        <div class="shape circle" style="width: 100px; height: 100px; top: 10%; left: 5%; animation-duration: 20s;"></div>
        <div class="shape circle" style="width: 150px; height: 150px; top: 60%; right: 10%; animation-duration: 25s;"></div>
        <div class="shape" style="width: 80px; height: 80px; background: var(--secondary); top: 30%; right: 15%; animation-duration: 18s;"></div>
    </div>

    <!-- Emoji Decorations -->
    <div class="emoji-decoration emoji-1">👋</div>
    <div class="emoji-decoration emoji-2">💪</div>
    <div class="emoji-decoration emoji-3">🌸</div>
    <div class="emoji-decoration emoji-4">🛡️</div>

    <!-- Welcome Message -->
    <div class="welcome-message" id="welcomeMessage">
        Welcome to NariSuraksha! 💜
    </div>

    <!-- Emergency Float Button -->
    <div class="emergency-float" id="emergencyFloat">
        <i class="fas fa-phone-alt"></i>
    </div>

    <div class="emergency-panel" id="emergencyPanel">
        <h3><i class="fas fa-exclamation-triangle"></i> Emergency Contacts</h3>
        <div class="emergency-contact">
            <i class="fas fa-phone"></i>
            <span>Police: 100</span>
        </div>
        <div class="emergency-contact">
            <i class="fas fa-phone"></i>
            <span>Women Helpline: 1091</span>
        </div>
        <div class="emergency-contact">
            <i class="fas fa-phone"></i>
            <span>National Emergency: 112</span>
        </div>
        <div class="emergency-contact">
            <i class="fas fa-ambulance"></i>
            <span>Ambulance: 108</span>
        </div>
    </div>

    <!-- Main Content -->
    <div class="header">
        <h1>NariSuraksha</h1>
        <p>Your safety is our priority. Join our community to create a safer environment for women everywhere.</p>
    </div>

    <div class="login-container">
        <div class="login-box admin-box">
            <div class="role-icon">👩‍💼</div>
            <h2>Admin</h2>
            <form action="AdminLogin" method="post">
                <input type="text" name="email" placeholder="Admin Username" required>
                <input type="password" name="password" placeholder="Password" required>
                <div class="button-group">
                    <button type="submit">Login</button>
                </div>
            </form>
        </div>

        <div class="login-box user-box">
            <div class="role-icon">👩</div>
            <h2>User</h2>
            <form action="UserLogin" method="post">
                <input type="text" name="uemail" placeholder="Email or Phone" required>
                <input type="password" name="upassword" placeholder="Password" required>
                <div class="button-group">
                    <button type="submit">Login</button>
                    <a href="UserRegister.jsp" class="register-link">Register</a>
                </div>
            </form>
        </div>

        <div class="login-box police-box">
            <div class="role-icon">👮‍♀️</div>
            <h2>Police</h2>
            <form action="PoliceLogin" method="post">
                <input type="text" name="pemail" placeholder="Badge ID" required>
                <input type="password" name="ppassword" placeholder="Password" required>
                <div class="button-group">
                    <button type="submit">Login</button>
                    <a href="PoliceRegister.html" class="register-link">Register</a>
                </div>
            </form>
        </div>
    </div>

    <div class="safety-tips">
        <i>⚠️</i>
        <span>Remember: Your safety comes first. Trust your instincts.</span>
    </div>

    <script>
        // Social messages with images floating upward
        const messages = [
            {
                text: "Speak up against harassment! Your voice matters.",
                img: "https://images.unsplash.com/photo-1488521787991-ed7bbaae773c?w=200"
            },
            {
                text: "1 in 3 women experience violence. Let's change this!",
                img: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200"
            },
            {
                text: "Know your rights. Download our safety guide.",
                img: "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?w=200"
            },
            {
                text: "Use our panic button feature in emergencies.",
                img: "https://images.unsplash.com/photo-1517841905240-472988babdf9?w=200"
            },
            {
                text: "Self-defense workshops every Saturday!",
                img: "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=200"
            }
        ];

        const messageBg = document.getElementById('messageBackground');

        function createFloatingMessage() {
            const message = messages[Math.floor(Math.random() * messages.length)];
            const messageElement = document.createElement('div');
            messageElement.className = 'floating-message';
            
            // Random horizontal position
            const leftPos = Math.random() * 80 + 10;
            messageElement.style.left = `${leftPos}%`;
            
            // Random animation duration (10-20s)
            const duration = Math.random() * 10 + 10;
            messageElement.style.animationDuration = `${duration}s`;
            
            // Random delay (0-5s)
            const delay = Math.random() * 5;
            messageElement.style.animationDelay = `${delay}s`;
            
            messageElement.innerHTML = `
                <img src="${message.img}" alt="Safety message">
                <div class="message-content">${message.text}</div>
            `;
            
            messageBg.appendChild(messageElement);
            
            // Remove element after animation completes
            setTimeout(() => {
                messageElement.remove();
            }, duration * 1000);
        }

        // Create initial messages
        for (let i = 0; i < 5; i++) {
            createFloatingMessage();
        }

        // Continue creating new messages periodically
        setInterval(createFloatingMessage, 3000);

        // Emergency float button functionality
        const emergencyFloat = document.getElementById('emergencyFloat');
        const emergencyPanel = document.getElementById('emergencyPanel');

        emergencyFloat.addEventListener('click', () => {
            emergencyPanel.classList.toggle('show');
        });

        // Close panel when clicking outside
        document.addEventListener('click', (e) => {
            if (!emergencyFloat.contains(e.target) && !emergencyPanel.contains(e.target)) {
                emergencyPanel.classList.remove('show');
            }
        });

        // Create floating shapes
        const colors = ['#ff6b6b', '#6c5ce7', '#00b894', '#fdcb6e', '#e84393'];
        const floatingShapes = document.querySelector('.floating-shapes');
        
        for (let i = 0; i < 8; i++) {
            const shape = document.createElement('div');
            const size = Math.random() * 100 + 50;
            const isCircle = Math.random() > 0.5;
            
            shape.classList.add('shape');
            if (isCircle) {
                shape.classList.add('circle');
            }
            
            shape.style.width = `${size}px`;
            shape.style.height = `${size}px`;
            shape.style.background = colors[Math.floor(Math.random() * colors.length)];
            shape.style.left = `${Math.random() * 100}%`;
            shape.style.top = `${Math.random() * 100 + 100}%`;
            shape.style.animationDuration = `${Math.random() * 20 + 15}s`;
            shape.style.animationDelay = `${Math.random() * 5}s`;
            
            floatingShapes.appendChild(shape);
        }

        // Friendly greeting based on time of day
        const welcome = document.getElementById('welcomeMessage');
        const hour = new Date().getHours();
        let greeting = '';
        
        if (hour < 12) greeting = 'Good morning!';
        else if (hour < 18) greeting = 'Good afternoon!';
        else greeting = 'Good evening!';
        
        welcome.textContent = `${greeting} Welcome to NariSuraksha! 💜`;
    </script>
</body>
</html>