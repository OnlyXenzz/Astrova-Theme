#!/bin/bash
# ============================================================
#  AstrovaHost — Pterodactyl Theme Installer
#  Client panel only · Admin panel untouched
#  Usage: bash astrova-theme.sh
# ============================================================

set -e

PANEL="${PANEL_DIR:-/var/www/pterodactyl}"
THEME_DIR="$PANEL/public/themes/astrova"
FONT_URL="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700;900&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;1,300&display=swap"

R='\033[0;31m' G='\033[0;32m' Y='\033[1;33m' B='\033[0;34m' W='\033[1m' N='\033[0m'

echo -e "\n${B}${W}✦ AstrovaHost Theme Installer ✦${N}"
echo -e "${B}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${N}\n"

# ── Cek panel ──
[ ! -d "$PANEL" ] && echo -e "${R}[✗] Panel tidak ditemukan di $PANEL${N}\n    Set: PANEL_DIR=/path/to/panel bash astrova-theme.sh" && exit 1
echo -e "${G}[✓] Panel: $PANEL${N}"

# ── Buat folder theme ──
mkdir -p "$THEME_DIR"
echo -e "${G}[✓] Folder theme: $THEME_DIR${N}"

# ── Tulis CSS ──
echo -e "${B}[→] Menulis astrova.css...${N}"
cat > "$THEME_DIR/astrova.css" << 'ENDCSS'
/* ============================================================
   ASTROVA HOST — PTERODACTYL CLIENT THEME v1.1
   Client panel only · Admin panel untouched
   Cinzel + Raleway · Deep navy/indigo + gold
   ============================================================ */

@import url('https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700;900&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;1,300&display=swap');

/* ── GUARD: semua style hanya aktif jika BUKAN admin panel ── */

body:not([data-admin-panel]) {
  --bg:      #06070e;
  --bg2:     #0b0d1a;
  --surface: #0f1120;
  --surface2:#141729;
  --border:  rgba(100,120,255,0.13);
  --accent:  #6c7fff;
  --accent2: #a78bfa;
  --gold:    #c9993a;
  --gold2:   #e8be6a;
  --text:    #e2e4f0;
  --muted:   #6b6f8a;
  --glow:    rgba(108,127,255,0.2);
  --red:     #ff4d6d;
  --green:   #4ade80;
  --yellow:  #fbbf24;
}

body:not([data-admin-panel]) {
  background: var(--bg) !important;
  color: var(--text) !important;
  font-family: 'Raleway', sans-serif !important;
  font-weight: 400 !important;
  line-height: 1.7 !important;
  overflow-x: hidden !important;
}

body:not([data-admin-panel]) *, body:not([data-admin-panel]) *::before, body:not([data-admin-panel]) *::after { box-sizing: border-box; }

/* Noise overlay */
body:not([data-admin-panel])::after {
  content: '';
  position: fixed;
  inset: 0;
  background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 200 200' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='n'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.85' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23n)' opacity='0.035'/%3E%3C/svg%3E");
  pointer-events: none;
  z-index: 9999;
  opacity: .5;
}

/* Scrollbar */
body:not([data-admin-panel]) ::-webkit-scrollbar { width: 6px; height: 6px; }
body:not([data-admin-panel]) ::-webkit-scrollbar-track { background: var(--bg); }
body:not([data-admin-panel]) ::-webkit-scrollbar-thumb { background: var(--accent); border-radius: 3px; }

/* NAV */
body:not([data-admin-panel]) nav,
body:not([data-admin-panel]) header,
body:not([data-admin-panel]) [class*="Navigation"],
body:not([data-admin-panel]) div[class*="Header"] {
  background: rgba(6,7,14,0.85) !important;
  backdrop-filter: blur(16px) !important;
  border-bottom: 1px solid var(--border) !important;
  box-shadow: none !important;
}

body:not([data-admin-panel]) [class*="logo"],
body:not([data-admin-panel]) [class*="Logo"] {
  font-family: 'Cinzel', serif !important;
  font-weight: 700 !important;
  font-size: 1.15rem !important;
  letter-spacing: .12em !important;
  background: linear-gradient(135deg, var(--gold), var(--gold2)) !important;
  -webkit-background-clip: text !important;
  -webkit-text-fill-color: transparent !important;
  text-decoration: none !important;
}

body:not([data-admin-panel]) nav a,
body:not([data-admin-panel]) [class*="NavLink"] {
  color: var(--muted) !important;
  font-family: 'Raleway', sans-serif !important;
  font-size: .82rem !important;
  font-weight: 500 !important;
  letter-spacing: .06em !important;
  text-transform: uppercase !important;
  text-decoration: none !important;
  transition: color .3s !important;
}

body:not([data-admin-panel]) nav a:hover,
body:not([data-admin-panel]) [class*="NavLink"]:hover,
body:not([data-admin-panel]) nav a.active,
body:not([data-admin-panel]) [class*="NavLink"].active { color: var(--accent) !important; }

/* SIDEBAR */
body:not([data-admin-panel]) aside,
body:not([data-admin-panel]) [class*="Sidebar"],
body:not([data-admin-panel]) [class*="SubNavigation"] {
  background: var(--surface) !important;
  border-right: 1px solid var(--border) !important;
  box-shadow: none !important;
}

body:not([data-admin-panel]) aside a,
body:not([data-admin-panel]) [class*="Sidebar"] a,
body:not([data-admin-panel]) [class*="SubNavigation"] a {
  display: flex !important;
  align-items: center !important;
  gap: .75rem !important;
  padding: .65rem 1.5rem !important;
  color: var(--muted) !important;
  font-family: 'Raleway', sans-serif !important;
  font-size: .875rem !important;
  font-weight: 500 !important;
  text-decoration: none !important;
  border-left: 3px solid transparent !important;
  transition: all .3s !important;
}

body:not([data-admin-panel]) aside a:hover,
body:not([data-admin-panel]) [class*="Sidebar"] a:hover { color: var(--text) !important; background: rgba(108,127,255,0.06) !important; }

body:not([data-admin-panel]) aside a.active,
body:not([data-admin-panel]) aside a[class*="active"],
body:not([data-admin-panel]) [class*="Sidebar"] a[class*="active"],
body:not([data-admin-panel]) [class*="active"] > a {
  color: var(--accent) !important;
  background: rgba(108,127,255,0.1) !important;
  border-left-color: var(--accent) !important;
}

body:not([data-admin-panel]) [class*="NavigationLabel"],
body:not([data-admin-panel]) [class*="nav-label"] {
  font-family: 'Cinzel', serif !important;
  font-size: .65rem !important;
  font-weight: 700 !important;
  letter-spacing: .15em !important;
  text-transform: uppercase !important;
  color: var(--muted) !important;
  padding: .75rem 1.5rem .25rem !important;
}

/* MAIN */
body:not([data-admin-panel]) main,
body:not([data-admin-panel]) [class*="ContentContainer"],
body:not([data-admin-panel]) [class*="PageContent"],
body:not([data-admin-panel]) div[class*="main-content"] { background: var(--bg) !important; }

body:not([data-admin-panel]) [class*="PageWrapper"],
body:not([data-admin-panel]) .container { background: transparent !important; }

/* CARDS */
body:not([data-admin-panel]) [class*="ServerBox"],
body:not([data-admin-panel]) [class*="Card"],
body:not([data-admin-panel]) [class*="-card"],
body:not([data-admin-panel]) [class*="ContentBox"] {
  background: var(--surface) !important;
  border: 1px solid var(--border) !important;
  border-radius: 12px !important;
  box-shadow: none !important;
  transition: border-color .3s, transform .3s, box-shadow .3s !important;
}

body:not([data-admin-panel]) [class*="Card"]:hover,
body:not([data-admin-panel]) [class*="ServerBox"]:hover {
  border-color: rgba(108,127,255,0.3) !important;
  transform: translateY(-3px) !important;
  box-shadow: 0 16px 40px rgba(0,0,0,0.4) !important;
}

body:not([data-admin-panel]) [class*="inner"],
body:not([data-admin-panel]) [class*="Inner"] { background: var(--surface2) !important; border: 1px solid var(--border) !important; border-radius: 8px !important; }

/* HEADINGS */
body:not([data-admin-panel]) h1,
body:not([data-admin-panel]) h2,
body:not([data-admin-panel]) h3,
body:not([data-admin-panel]) h4,
body:not([data-admin-panel]) h5,
body:not([data-admin-panel]) [class*="Title"],
body:not([data-admin-panel]) [class*="Heading"] {
  font-family: 'Cinzel', serif !important;
  font-weight: 700 !important;
  color: var(--text) !important;
  letter-spacing: .03em !important;
  line-height: 1.2 !important;
}

body:not([data-admin-panel]) h1 { font-size: clamp(1.75rem,4vw,2.75rem) !important; }
body:not([data-admin-panel]) h2 { font-size: clamp(1.4rem,3vw,2rem) !important; }
body:not([data-admin-panel]) h3 { font-size: 1.15rem !important; }
body:not([data-admin-panel]) h4 { font-size: .95rem !important; }

body:not([data-admin-panel]) p, body:not([data-admin-panel]) span,
body:not([data-admin-panel]) [class*="Description"],
body:not([data-admin-panel]) [class*="Subtitle"] { font-family: 'Raleway', sans-serif !important; }

body:not([data-admin-panel]) [class*="text-gray"],
body:not([data-admin-panel]) [class*="text-muted"],
body:not([data-admin-panel]) [class*="muted"],
body:not([data-admin-panel]) small { color: var(--muted) !important; }

/* BUTTONS */
body:not([data-admin-panel]) button[class*="primary"],
body:not([data-admin-panel]) a[class*="primary"],
body:not([data-admin-panel]) [class*="ButtonPrimary"],
body:not([data-admin-panel]) button[type="submit"],
body:not([data-admin-panel]) [class*="SubmitButton"] {
  background: linear-gradient(135deg, var(--accent), var(--accent2)) !important;
  color: #fff !important;
  border: none !important;
  border-radius: 8px !important;
  padding: .65rem 1.75rem !important;
  font-family: 'Raleway', sans-serif !important;
  font-weight: 600 !important;
  font-size: .9rem !important;
  letter-spacing: .04em !important;
  cursor: pointer !important;
  box-shadow: 0 4px 24px rgba(108,127,255,0.3) !important;
  transition: all .3s !important;
  text-decoration: none !important;
}

body:not([data-admin-panel]) button[class*="primary"]:hover,
body:not([data-admin-panel]) a[class*="primary"]:hover,
body:not([data-admin-panel]) button[type="submit"]:hover { transform: translateY(-2px) !important; box-shadow: 0 8px 32px rgba(108,127,255,0.45) !important; opacity: .92 !important; }

body:not([data-admin-panel]) button[class*="secondary"],
body:not([data-admin-panel]) a[class*="secondary"],
body:not([data-admin-panel]) [class*="ButtonSecondary"],
body:not([data-admin-panel]) button[class*="ghost"] {
  background: transparent !important;
  color: var(--text) !important;
  border: 1px solid var(--border) !important;
  border-radius: 8px !important;
  padding: .65rem 1.75rem !important;
  font-family: 'Raleway', sans-serif !important;
  font-weight: 600 !important;
  cursor: pointer !important;
  transition: all .3s !important;
}

body:not([data-admin-panel]) button[class*="secondary"]:hover,
body:not([data-admin-panel]) a[class*="secondary"]:hover { border-color: var(--accent) !important; color: var(--accent) !important; }

body:not([data-admin-panel]) button[class*="danger"],
body:not([data-admin-panel]) [class*="ButtonDanger"] {
  background: rgba(255,77,109,0.12) !important;
  color: var(--red) !important;
  border: 1px solid rgba(255,77,109,0.25) !important;
  border-radius: 8px !important;
  padding: .65rem 1.75rem !important;
  font-family: 'Raleway', sans-serif !important;
  font-weight: 600 !important;
  cursor: pointer !important;
  transition: all .3s !important;
}

body:not([data-admin-panel]) button[class*="danger"]:hover { background: rgba(255,77,109,0.22) !important; }

body:not([data-admin-panel]) button[class*="success"],
body:not([data-admin-panel]) [class*="ButtonSuccess"] {
  background: rgba(74,222,128,0.12) !important;
  color: var(--green) !important;
  border: 1px solid rgba(74,222,128,0.25) !important;
  border-radius: 8px !important;
  padding: .65rem 1.75rem !important;
  font-family: 'Raleway', sans-serif !important;
  font-weight: 600 !important;
  cursor: pointer !important;
  transition: background .3s !important;
}

/* INPUTS */
body:not([data-admin-panel]) input,
body:not([data-admin-panel]) textarea,
body:not([data-admin-panel]) select,
body:not([data-admin-panel]) [class*="Input"],
body:not([data-admin-panel]) [class*="TextArea"] {
  background: var(--surface2) !important;
  border: 1px solid var(--border) !important;
  border-radius: 8px !important;
  color: var(--text) !important;
  font-family: 'Raleway', sans-serif !important;
  font-size: .9rem !important;
  padding: .65rem 1rem !important;
  transition: border-color .3s, box-shadow .3s !important;
  outline: none !important;
}

body:not([data-admin-panel]) input:focus,
body:not([data-admin-panel]) textarea:focus,
body:not([data-admin-panel]) select:focus { border-color: var(--accent) !important; box-shadow: 0 0 0 3px rgba(108,127,255,0.15) !important; }

body:not([data-admin-panel]) input::placeholder,
body:not([data-admin-panel]) textarea::placeholder { color: var(--muted) !important; }

body:not([data-admin-panel]) label {
  font-family: 'Raleway', sans-serif !important;
  font-size: .82rem !important;
  font-weight: 600 !important;
  letter-spacing: .06em !important;
  text-transform: uppercase !important;
  color: var(--muted) !important;
  display: block !important;
  margin-bottom: .4rem !important;
}

/* TABLES */
body:not([data-admin-panel]) table { width: 100% !important; border-collapse: collapse !important; font-family: 'Raleway', sans-serif !important; }
body:not([data-admin-panel]) thead { background: var(--surface2) !important; border-bottom: 1px solid var(--border) !important; }
body:not([data-admin-panel]) th { font-family: 'Cinzel', serif !important; font-size: .72rem !important; font-weight: 700 !important; letter-spacing: .1em !important; text-transform: uppercase !important; color: var(--muted) !important; padding: .75rem 1rem !important; text-align: left !important; }
body:not([data-admin-panel]) td { padding: .9rem 1rem !important; font-size: .875rem !important; color: var(--text) !important; border-bottom: 1px solid var(--border) !important; }
body:not([data-admin-panel]) tr:hover td { background: rgba(108,127,255,0.04) !important; }
body:not([data-admin-panel]) tr:last-child td { border-bottom: none !important; }

/* STATUS DOTS */
body:not([data-admin-panel]) [class*="StatusIndicator"],
body:not([data-admin-panel]) [class*="StatusDot"] { width: 8px !important; height: 8px !important; border-radius: 50% !important; display: inline-block !important; }
body:not([data-admin-panel]) [data-status="running"],
body:not([data-admin-panel]) [data-status="online"] { background: var(--green) !important; box-shadow: 0 0 6px var(--green) !important; }
body:not([data-admin-panel]) [data-status="offline"],
body:not([data-admin-panel]) [data-status="stopped"] { background: var(--red) !important; }
body:not([data-admin-panel]) [data-status="starting"] { background: var(--yellow) !important; }

/* BADGES */
body:not([data-admin-panel]) [class*="Badge"],
body:not([data-admin-panel]) span[class*="pill"],
body:not([data-admin-panel]) [class*="Tag"] {
  display: inline-flex !important; align-items: center !important; gap: .3rem !important;
  background: rgba(108,127,255,0.12) !important; border: 1px solid rgba(108,127,255,0.25) !important;
  border-radius: 999px !important; padding: .2rem .7rem !important;
  font-size: .72rem !important; font-weight: 600 !important; letter-spacing: .06em !important; color: var(--accent) !important;
}

/* ALERTS */
body:not([data-admin-panel]) [class*="Alert"],
body:not([data-admin-panel]) [class*="alert"],
body:not([data-admin-panel]) [class*="Flash"],
body:not([data-admin-panel]) [class*="Notice"] { border-radius: 10px !important; padding: 1rem 1.25rem !important; font-family: 'Raleway', sans-serif !important; font-size: .9rem !important; border-left: 3px solid !important; }
body:not([data-admin-panel]) [class*="Alert"][class*="success"], body:not([data-admin-panel]) [class*="alert-success"] { background: rgba(74,222,128,0.08) !important; border-color: var(--green) !important; color: var(--green) !important; }
body:not([data-admin-panel]) [class*="Alert"][class*="danger"],  body:not([data-admin-panel]) [class*="alert-danger"]  { background: rgba(255,77,109,0.08) !important; border-color: var(--red) !important;   color: var(--red) !important; }
body:not([data-admin-panel]) [class*="Alert"][class*="warning"], body:not([data-admin-panel]) [class*="alert-warning"] { background: rgba(251,191,36,0.08) !important; border-color: var(--yellow) !important; color: var(--yellow) !important; }
body:not([data-admin-panel]) [class*="Alert"][class*="info"],    body:not([data-admin-panel]) [class*="alert-info"]    { background: rgba(108,127,255,0.08) !important; border-color: var(--accent) !important; color: var(--accent) !important; }

/* PROGRESS BARS */
body:not([data-admin-panel]) [class*="ProgressBar"],
body:not([data-admin-panel]) [class*="progress-bar"],
body:not([data-admin-panel]) [class*="UsageBar"] { background: var(--surface2) !important; border-radius: 3px !important; height: 5px !important; overflow: hidden !important; }
body:not([data-admin-panel]) [class*="ProgressFill"],
body:not([data-admin-panel]) [class*="progress-fill"],
body:not([data-admin-panel]) [class*="ProgressBar"] > div { height: 100% !important; border-radius: 3px !important; background: linear-gradient(90deg, var(--accent), var(--accent2)) !important; transition: width .5s !important; }

/* MODALS */
body:not([data-admin-panel]) [class*="Modal"],
body:not([data-admin-panel]) [class*="Dialog"],
body:not([data-admin-panel]) [class*="modal"] { background: var(--surface) !important; border: 1px solid var(--border) !important; border-radius: 14px !important; box-shadow: 0 24px 64px rgba(0,0,0,0.6) !important; color: var(--text) !important; font-family: 'Raleway', sans-serif !important; }
body:not([data-admin-panel]) [class*="Overlay"],
body:not([data-admin-panel]) [class*="Backdrop"] { background: rgba(6,7,14,0.75) !important; backdrop-filter: blur(6px) !important; }

/* CONSOLE / TERMINAL */
body:not([data-admin-panel]) [class*="Console"],
body:not([data-admin-panel]) [class*="Terminal"],
body:not([data-admin-panel]) [class*="xterm"],
body:not([data-admin-panel]) pre,
body:not([data-admin-panel]) code { background: #020308 !important; border: 1px solid var(--border) !important; border-radius: 8px !important; font-family: 'JetBrains Mono','Fira Code','Cascadia Code',monospace !important; font-size: .82rem !important; color: #c9d1d9 !important; }
body:not([data-admin-panel]) [class*="ConsoleInput"] { background: var(--surface2) !important; border: 1px solid var(--border) !important; border-radius: 0 0 8px 8px !important; color: var(--text) !important; }

/* STATS */
body:not([data-admin-panel]) [class*="StatBlock"],
body:not([data-admin-panel]) [class*="MetricsCard"],
body:not([data-admin-panel]) [class*="UsageCard"] { background: var(--surface) !important; border: 1px solid var(--border) !important; border-radius: 10px !important; padding: 1.25rem !important; }
body:not([data-admin-panel]) [class*="StatValue"],
body:not([data-admin-panel]) [class*="MetricValue"] { font-family: 'Cinzel', serif !important; font-size: 1.6rem !important; font-weight: 700 !important; color: var(--text) !important; }

/* TABS */
body:not([data-admin-panel]) [class*="TabBar"],
body:not([data-admin-panel]) [role="tablist"] { border-bottom: 1px solid var(--border) !important; background: transparent !important; display: flex !important; gap: .5rem !important; }
body:not([data-admin-panel]) [class*="-tab"],
body:not([data-admin-panel]) [role="tab"] { font-family: 'Raleway', sans-serif !important; font-size: .82rem !important; font-weight: 600 !important; letter-spacing: .06em !important; text-transform: uppercase !important; color: var(--muted) !important; padding: .75rem 1.25rem !important; border-bottom: 2px solid transparent !important; cursor: pointer !important; transition: all .3s !important; }
body:not([data-admin-panel]) [role="tab"][aria-selected="true"],
body:not([data-admin-panel]) [class*="-tab"][class*="active"] { color: var(--accent) !important; border-bottom-color: var(--accent) !important; }

/* DIVIDERS */
body:not([data-admin-panel]) hr { border: none !important; border-top: 1px solid var(--border) !important; margin: 1.5rem 0 !important; }

/* DROPDOWNS */
body:not([data-admin-panel]) [class*="Dropdown"],
body:not([data-admin-panel]) [class*="Popover"] { background: var(--surface) !important; border: 1px solid var(--border) !important; border-radius: 10px !important; box-shadow: 0 16px 48px rgba(0,0,0,0.5) !important; overflow: hidden !important; }
body:not([data-admin-panel]) [class*="MenuItem"] { display: flex !important; align-items: center !important; gap: .6rem !important; padding: .65rem 1rem !important; color: var(--muted) !important; font-family: 'Raleway', sans-serif !important; font-size: .875rem !important; text-decoration: none !important; transition: all .3s !important; border: none !important; background: transparent !important; width: 100% !important; cursor: pointer !important; }
body:not([data-admin-panel]) [class*="MenuItem"]:hover { background: rgba(108,127,255,0.08) !important; color: var(--text) !important; }

/* FILE MANAGER */
body:not([data-admin-panel]) [class*="FileRow"],
body:not([data-admin-panel]) [class*="FileItem"] { display: flex !important; align-items: center !important; padding: .65rem 1rem !important; border-bottom: 1px solid var(--border) !important; transition: background .2s !important; cursor: pointer !important; }
body:not([data-admin-panel]) [class*="FileRow"]:hover,
body:not([data-admin-panel]) [class*="FileItem"]:hover { background: rgba(108,127,255,0.05) !important; }

/* CHECKBOX / TOGGLE */
body:not([data-admin-panel]) input[type="checkbox"] { width: 16px !important; height: 16px !important; accent-color: var(--accent) !important; }
body:not([data-admin-panel]) [class*="Switch"],
body:not([data-admin-panel]) [class*="Toggle"] { background: var(--surface2) !important; border: 1px solid var(--border) !important; }
body:not([data-admin-panel]) [class*="Switch"][class*="checked"],
body:not([data-admin-panel]) [class*="Toggle"][class*="checked"] { background: var(--accent) !important; border-color: var(--accent) !important; }

/* TOOLTIP */
body:not([data-admin-panel]) [class*="Tooltip"] { background: var(--surface2) !important; border: 1px solid var(--border) !important; border-radius: 6px !important; font-family: 'Raleway', sans-serif !important; font-size: .78rem !important; color: var(--text) !important; padding: .4rem .75rem !important; }

/* SPINNER */
body:not([data-admin-panel]) [class*="Spinner"],
body:not([data-admin-panel]) [class*="Loader"] { border-color: var(--border) !important; border-top-color: var(--accent) !important; }

/* FOOTER */
body:not([data-admin-panel]) footer { background: var(--surface) !important; border-top: 1px solid var(--border) !important; color: var(--muted) !important; font-family: 'Raleway', sans-serif !important; font-size: .8rem !important; }

/* ANIMATIONS */
@keyframes fadeUp { from { opacity: 0; transform: translateY(24px); } to { opacity: 1; transform: translateY(0); } }
body:not([data-admin-panel]) main > *,
body:not([data-admin-panel]) [class*="ContentContainer"] > * { animation: fadeUp .5s ease both; }

/* RESPONSIVE */
@media (max-width: 900px) {
  body:not([data-admin-panel]) aside,
  body:not([data-admin-panel]) [class*="Sidebar"] { transform: translateX(-100%) !important; position: fixed !important; z-index: 300 !important; transition: transform .3s !important; }
  body:not([data-admin-panel]) aside.open,
  body:not([data-admin-panel]) [class*="Sidebar"][class*="open"] { transform: translateX(0) !important; }
}
ENDCSS

echo -e "${G}[✓] CSS ditulis${N}"

# ── Tulis admin guard JS ──
echo -e "${B}[→] Menulis admin-guard.js...${N}"
cat > "$THEME_DIR/admin-guard.js" << 'ENDJS'
/* AstrovaHost — Admin Guard: inject [data-admin-panel] di halaman /admin* */
(function(){
  if(window.location.pathname.startsWith('/admin')){
    document.documentElement.setAttribute('data-admin-panel','');
    function mark(){ document.body && document.body.setAttribute('data-admin-panel',''); }
    document.body ? mark() : document.addEventListener('DOMContentLoaded', mark);
  }
})();
ENDJS

echo -e "${G}[✓] JS guard ditulis${N}"

# ── Inject ke blade layout ──
# Pterodactyl client panel layout
BLADE_PATHS=(
  "$PANEL/resources/views/layouts/master.blade.php"
  "$PANEL/resources/views/layouts/app.blade.php"
  "$PANEL/resources/views/app.blade.php"
)

BLADE_FOUND=""
for f in "${BLADE_PATHS[@]}"; do
  [ -f "$f" ] && BLADE_FOUND="$f" && break
done

if [ -n "$BLADE_FOUND" ]; then
  echo -e "${B}[→] Injecting ke blade: $BLADE_FOUND${N}"

  # Cek sudah diinject belum
  if grep -q "astrova" "$BLADE_FOUND"; then
    echo -e "${Y}[!] Sudah diinject sebelumnya, skip.${N}"
  else
    # Inject sebelum </head>
    sed -i "s|</head>|    <script src=\"/themes/astrova/admin-guard.js\"></script>\n    <link rel=\"stylesheet\" href=\"/themes/astrova/astrova.css\">\n</head>|" "$BLADE_FOUND"
    echo -e "${G}[✓] Injected ke $BLADE_FOUND${N}"
  fi
else
  echo -e "${Y}[!] Blade layout tidak ditemukan otomatis.${N}"
  echo -e "    Tambah manual di dalam <head> panel kamu:\n"
  echo -e "    ${W}<script src=\"/themes/astrova/admin-guard.js\"></script>${N}"
  echo -e "    ${W}<link rel=\"stylesheet\" href=\"/themes/astrova/astrova.css\">${N}\n"
fi

# ── Permissions ──
echo -e "${B}[→] Set permissions...${N}"
chown -R www-data:www-data "$THEME_DIR" 2>/dev/null || \
  chown -R nginx:nginx "$THEME_DIR" 2>/dev/null || \
  echo -e "${Y}[!] Gagal set ownership, jalankan manual:${N}\n    chown -R www-data:www-data $THEME_DIR"
chmod -R 755 "$THEME_DIR"

# ── Clear cache ──
echo -e "${B}[→] Clear cache...${N}"
cd "$PANEL"
php artisan view:clear 2>/dev/null && php artisan cache:clear 2>/dev/null && php artisan config:clear 2>/dev/null
echo -e "${G}[✓] Cache cleared${N}"

# ── Done ──
echo -e "\n${G}${W}✦ Selesai! Theme AstrovaHost aktif di client panel. ✦${N}"
echo -e "${B}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${N}"
echo -e "  Hard refresh browser dengan ${W}Ctrl+Shift+R${N} kalau belum keliatan."
echo -e "  Admin panel di /admin tetap pakai style default.\n"
