#!/bin/bash

# ==============================================
#   AstrovaHost Theme for Pterodactyl Panel
#   Dark Navy + Blue-Purple + Gold Accent
# ==============================================

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}"
echo "  ╔═══════════════════════════════════════╗"
echo "  ║     AstrovaHost Pterodactyl Theme     ║"
echo "  ║        Dark Navy + Gold Edition       ║"
echo "  ╚═══════════════════════════════════════╝"
echo -e "${NC}"

# Auto-detect Pterodactyl path
detect_path() {
    POSSIBLE_PATHS=(
        "/var/www/pterodactyl"
        "/var/www/panel"
        "/var/www/html"
        "/srv/pterodactyl"
    )
    for p in "${POSSIBLE_PATHS[@]}"; do
        if [ -f "$p/public/index.php" ]; then
            echo "$p"
            return
        fi
    done
    echo ""
}

PTERO_PATH=$(detect_path)

if [ -z "$PTERO_PATH" ]; then
    echo -e "${YELLOW}[?] Tidak bisa auto-detect path Pterodactyl.${NC}"
    read -p "    Masukkan path manual (contoh: /var/www/pterodactyl): " PTERO_PATH
    if [ ! -f "$PTERO_PATH/public/index.php" ]; then
        echo -e "${RED}[✗] Path tidak valid! Pastikan Pterodactyl sudah terinstall.${NC}"
        exit 1
    fi
fi

echo -e "${GREEN}[✓] Pterodactyl ditemukan di: ${PTERO_PATH}${NC}"

# Backup
echo -e "${BLUE}[→] Membuat backup...${NC}"
BACKUP_DIR="$PTERO_PATH/astrova-backup-$(date +%Y%m%d%H%M%S)"
mkdir -p "$BACKUP_DIR"

[ -f "$PTERO_PATH/public/themes/pterodactyl/css/pterodactyl.css" ] && \
    cp "$PTERO_PATH/public/themes/pterodactyl/css/pterodactyl.css" "$BACKUP_DIR/"

[ -f "$PTERO_PATH/resources/views/layouts/admin.blade.php" ] && \
    cp "$PTERO_PATH/resources/views/layouts/admin.blade.php" "$BACKUP_DIR/"

[ -f "$PTERO_PATH/resources/views/layouts/master.blade.php" ] && \
    cp "$PTERO_PATH/resources/views/layouts/master.blade.php" "$BACKUP_DIR/"

echo -e "${GREEN}[✓] Backup disimpan di: ${BACKUP_DIR}${NC}"

# ==========================================
#   CSS CONTENT
# ==========================================

ASTROVA_CSS='@import url("https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700;900&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;1,300&display=swap");

:root {
  --bg: #06070e;
  --bg2: #0b0d1a;
  --surface: #0f1120;
  --surface2: #141729;
  --border: rgba(100,120,255,0.13);
  --accent: #6c7fff;
  --accent2: #a78bfa;
  --gold: #c9993a;
  --gold2: #e8be6a;
  --text: #e2e4f0;
  --muted: #6b6f8a;
  --glow: rgba(108,127,255,0.2);
  --red: #ff4d6d;
  --green: #4ade80;
  --yellow: #fbbf24;
}

/* BASE */
body, html {
  background: var(--bg) !important;
  color: var(--text) !important;
  font-family: "Raleway", sans-serif !important;
}

/* SCROLLBAR */
::-webkit-scrollbar { width: 5px; }
::-webkit-scrollbar-track { background: var(--bg); }
::-webkit-scrollbar-thumb { background: var(--accent); border-radius: 3px; }

/* NAVBAR */
.navbar, .navbar-static-top, header.navbar {
  background: rgba(6,7,14,0.95) !important;
  border-bottom: 1px solid var(--border) !important;
  backdrop-filter: blur(16px) !important;
  box-shadow: none !important;
}
.navbar-brand, .navbar .navbar-brand {
  font-family: "Cinzel", serif !important;
  font-weight: 700 !important;
  background: linear-gradient(135deg, var(--gold), var(--gold2)) !important;
  -webkit-background-clip: text !important;
  -webkit-text-fill-color: transparent !important;
  letter-spacing: 0.08em !important;
}
.navbar-nav > li > a, .navbar-nav > li > a:hover {
  color: var(--muted) !important;
  font-size: 0.82rem !important;
  font-weight: 500 !important;
  letter-spacing: 0.05em !important;
  text-transform: uppercase !important;
}
.navbar-nav > li > a:hover { color: var(--text) !important; }
.navbar-nav > .active > a,
.navbar-nav > .active > a:hover {
  background: transparent !important;
  color: var(--accent) !important;
}

/* SIDEBAR */
.main-sidebar, .sidebar {
  background: var(--bg2) !important;
  border-right: 1px solid var(--border) !important;
}
.sidebar-menu > li > a {
  color: var(--muted) !important;
  font-size: 0.83rem !important;
  font-weight: 500 !important;
  letter-spacing: 0.04em !important;
  border-radius: 6px !important;
  margin: 2px 8px !important;
  transition: all 0.2s !important;
}
.sidebar-menu > li > a:hover {
  background: rgba(108,127,255,0.1) !important;
  color: var(--text) !important;
}
.sidebar-menu > li.active > a,
.sidebar-menu > li.menu-open > a {
  background: rgba(108,127,255,0.15) !important;
  color: var(--accent) !important;
  border-left: 2px solid var(--accent) !important;
}
.sidebar-menu .treeview-menu {
  background: transparent !important;
}
.sidebar-menu .treeview-menu > li > a {
  color: var(--muted) !important;
  font-size: 0.8rem !important;
  padding-left: 2.5rem !important;
}
.sidebar-menu .treeview-menu > li > a:hover {
  color: var(--accent) !important;
  background: rgba(108,127,255,0.07) !important;
}
.sidebar-menu .header {
  color: var(--muted) !important;
  font-size: 0.68rem !important;
  letter-spacing: 0.15em !important;
  text-transform: uppercase !important;
  font-weight: 600 !important;
  padding: 1rem 1rem 0.4rem !important;
}

/* CONTENT */
.content-wrapper, .main-content {
  background: var(--bg) !important;
}
.content-header {
  background: transparent !important;
  border-bottom: 1px solid var(--border) !important;
  padding: 1.5rem 2rem !important;
}
.content-header h1 {
  font-family: "Cinzel", serif !important;
  font-size: 1.4rem !important;
  font-weight: 700 !important;
  color: var(--text) !important;
}
.breadcrumb {
  background: transparent !important;
  color: var(--muted) !important;
  font-size: 0.8rem !important;
}
.breadcrumb > li + li::before { color: var(--muted) !important; }
.breadcrumb > .active { color: var(--accent) !important; }

/* CARDS / BOXES */
.box, .card, .panel {
  background: var(--surface) !important;
  border: 1px solid var(--border) !important;
  border-radius: 10px !important;
  box-shadow: none !important;
  color: var(--text) !important;
}
.box-header, .card-header, .panel-heading {
  background: transparent !important;
  border-bottom: 1px solid var(--border) !important;
  color: var(--text) !important;
  font-family: "Cinzel", serif !important;
  font-size: 0.9rem !important;
  font-weight: 600 !important;
  letter-spacing: 0.05em !important;
  padding: 1rem 1.25rem !important;
}
.box-body, .card-body {
  background: transparent !important;
  color: var(--text) !important;
}
.box-footer, .card-footer {
  background: var(--surface2) !important;
  border-top: 1px solid var(--border) !important;
}

/* TABLES */
.table, table {
  color: var(--text) !important;
}
.table > thead > tr > th {
  background: var(--surface2) !important;
  border-bottom: 1px solid var(--border) !important;
  color: var(--muted) !important;
  font-size: 0.73rem !important;
  font-weight: 600 !important;
  letter-spacing: 0.1em !important;
  text-transform: uppercase !important;
  padding: 0.85rem 1rem !important;
}
.table > tbody > tr > td {
  background: transparent !important;
  border-bottom: 1px solid rgba(100,120,255,0.07) !important;
  color: var(--text) !important;
  padding: 0.85rem 1rem !important;
  vertical-align: middle !important;
}
.table > tbody > tr:hover > td {
  background: rgba(108,127,255,0.04) !important;
}
.table-striped > tbody > tr:nth-of-type(odd) > td {
  background: rgba(15,17,32,0.5) !important;
}
.table-bordered, .table-bordered > thead > tr > th,
.table-bordered > tbody > tr > td {
  border-color: var(--border) !important;
}

/* FORMS */
.form-control, input, textarea, select {
  background: var(--surface2) !important;
  border: 1px solid var(--border) !important;
  border-radius: 6px !important;
  color: var(--text) !important;
  font-family: "Raleway", sans-serif !important;
  font-size: 0.875rem !important;
  transition: border-color 0.2s, box-shadow 0.2s !important;
}
.form-control:focus, input:focus, textarea:focus, select:focus {
  background: var(--surface2) !important;
  border-color: var(--accent) !important;
  box-shadow: 0 0 0 3px rgba(108,127,255,0.15) !important;
  color: var(--text) !important;
  outline: none !important;
}
.form-control::placeholder { color: var(--muted) !important; opacity: 1 !important; }
label, .control-label {
  color: var(--muted) !important;
  font-size: 0.8rem !important;
  font-weight: 600 !important;
  letter-spacing: 0.06em !important;
  text-transform: uppercase !important;
}
.form-group { margin-bottom: 1.25rem !important; }
.help-block { color: var(--muted) !important; font-size: 0.8rem !important; }

/* BUTTONS */
.btn {
  border-radius: 6px !important;
  font-family: "Raleway", sans-serif !important;
  font-weight: 600 !important;
  font-size: 0.83rem !important;
  letter-spacing: 0.04em !important;
  transition: all 0.2s !important;
  border: none !important;
}
.btn-primary, .btn-info {
  background: linear-gradient(135deg, var(--accent), var(--accent2)) !important;
  color: #fff !important;
  box-shadow: 0 4px 16px rgba(108,127,255,0.3) !important;
}
.btn-primary:hover, .btn-info:hover {
  opacity: 0.88 !important;
  box-shadow: 0 6px 24px rgba(108,127,255,0.45) !important;
  transform: translateY(-1px) !important;
}
.btn-success {
  background: linear-gradient(135deg, #22c55e, #4ade80) !important;
  color: #fff !important;
}
.btn-danger {
  background: linear-gradient(135deg, #ef4444, var(--red)) !important;
  color: #fff !important;
}
.btn-warning {
  background: linear-gradient(135deg, var(--gold), var(--gold2)) !important;
  color: #06070e !important;
}
.btn-default {
  background: var(--surface2) !important;
  border: 1px solid var(--border) !important;
  color: var(--text) !important;
}
.btn-default:hover {
  border-color: var(--accent) !important;
  color: var(--accent) !important;
}

/* ALERTS */
.alert {
  border-radius: 8px !important;
  border: none !important;
  font-size: 0.875rem !important;
  padding: 1rem 1.25rem !important;
}
.alert-success { background: rgba(74,222,128,0.1) !important; color: #4ade80 !important; border-left: 3px solid #4ade80 !important; }
.alert-danger, .alert-error { background: rgba(255,77,109,0.1) !important; color: var(--red) !important; border-left: 3px solid var(--red) !important; }
.alert-warning { background: rgba(201,153,58,0.1) !important; color: var(--gold2) !important; border-left: 3px solid var(--gold2) !important; }
.alert-info { background: rgba(108,127,255,0.1) !important; color: var(--accent) !important; border-left: 3px solid var(--accent) !important; }

/* BADGES / LABELS */
.badge, .label {
  border-radius: 4px !important;
  font-size: 0.7rem !important;
  font-weight: 600 !important;
  letter-spacing: 0.06em !important;
  padding: 0.25rem 0.6rem !important;
}
.label-success, .badge-success { background: rgba(74,222,128,0.15) !important; color: #4ade80 !important; }
.label-danger, .badge-danger { background: rgba(255,77,109,0.15) !important; color: var(--red) !important; }
.label-warning, .badge-warning { background: rgba(201,153,58,0.15) !important; color: var(--gold2) !important; }
.label-info, .badge-info { background: rgba(108,127,255,0.15) !important; color: var(--accent) !important; }
.label-primary, .badge-primary { background: rgba(108,127,255,0.2) !important; color: var(--accent) !important; }

/* TABS */
.nav-tabs {
  border-bottom: 1px solid var(--border) !important;
}
.nav-tabs > li > a {
  color: var(--muted) !important;
  border: none !important;
  border-bottom: 2px solid transparent !important;
  border-radius: 0 !important;
  font-size: 0.83rem !important;
  font-weight: 500 !important;
  letter-spacing: 0.05em !important;
  padding: 0.75rem 1.25rem !important;
  transition: all 0.2s !important;
}
.nav-tabs > li > a:hover {
  background: transparent !important;
  color: var(--text) !important;
  border-bottom-color: var(--border) !important;
}
.nav-tabs > li.active > a {
  background: transparent !important;
  color: var(--accent) !important;
  border-bottom: 2px solid var(--accent) !important;
}
.tab-content { padding-top: 1.5rem !important; }

/* PAGINATION */
.pagination > li > a {
  background: var(--surface) !important;
  border: 1px solid var(--border) !important;
  color: var(--muted) !important;
  margin: 0 2px !important;
  border-radius: 6px !important;
  transition: all 0.2s !important;
}
.pagination > li > a:hover {
  background: rgba(108,127,255,0.1) !important;
  color: var(--accent) !important;
  border-color: var(--accent) !important;
}
.pagination > .active > a {
  background: linear-gradient(135deg, var(--accent), var(--accent2)) !important;
  border-color: transparent !important;
  color: #fff !important;
}

/* MODAL */
.modal-content {
  background: var(--surface) !important;
  border: 1px solid var(--border) !important;
  border-radius: 12px !important;
  box-shadow: 0 24px 60px rgba(0,0,0,0.6) !important;
}
.modal-header {
  background: var(--surface2) !important;
  border-bottom: 1px solid var(--border) !important;
  border-radius: 12px 12px 0 0 !important;
}
.modal-header .modal-title {
  font-family: "Cinzel", serif !important;
  font-size: 1rem !important;
  color: var(--text) !important;
}
.modal-body { color: var(--text) !important; }
.modal-footer {
  background: var(--surface2) !important;
  border-top: 1px solid var(--border) !important;
  border-radius: 0 0 12px 12px !important;
}
.modal-backdrop { background: rgba(0,0,0,0.7) !important; }

/* PROGRESS BAR */
.progress {
  background: var(--surface2) !important;
  border-radius: 999px !important;
  height: 6px !important;
}
.progress-bar {
  background: linear-gradient(90deg, var(--accent), var(--accent2)) !important;
  border-radius: 999px !important;
}
.progress-bar-success { background: linear-gradient(90deg, #22c55e, #4ade80) !important; }
.progress-bar-danger { background: linear-gradient(90deg, #ef4444, var(--red)) !important; }
.progress-bar-warning { background: linear-gradient(90deg, var(--gold), var(--gold2)) !important; }

/* DROPDOWN */
.dropdown-menu {
  background: var(--surface) !important;
  border: 1px solid var(--border) !important;
  border-radius: 8px !important;
  box-shadow: 0 12px 32px rgba(0,0,0,0.5) !important;
  padding: 0.4rem !important;
}
.dropdown-menu > li > a {
  color: var(--text) !important;
  border-radius: 5px !important;
  font-size: 0.85rem !important;
  padding: 0.5rem 0.9rem !important;
  transition: background 0.15s !important;
}
.dropdown-menu > li > a:hover {
  background: rgba(108,127,255,0.1) !important;
  color: var(--accent) !important;
}
.dropdown-menu .divider {
  background: var(--border) !important;
  margin: 0.3rem 0 !important;
}

/* CODE / PRE */
code, pre {
  background: var(--bg2) !important;
  border: 1px solid var(--border) !important;
  border-radius: 6px !important;
  color: var(--accent2) !important;
  font-family: "JetBrains Mono", "Fira Code", monospace !important;
  font-size: 0.82rem !important;
}
pre { padding: 1rem !important; overflow-x: auto !important; }

/* SMALL TEXT */
small, .small, .text-muted { color: var(--muted) !important; }
a { color: var(--accent) !important; text-decoration: none !important; transition: color 0.2s !important; }
a:hover { color: var(--accent2) !important; }
hr { border-color: var(--border) !important; }

/* INFO BOXES */
.info-box {
  background: var(--surface) !important;
  border: 1px solid var(--border) !important;
  border-radius: 10px !important;
  box-shadow: none !important;
}
.info-box-icon {
  border-radius: 10px 0 0 10px !important;
}
.info-box-content { color: var(--text) !important; }
.info-box-number { color: var(--text) !important; font-family: "Cinzel", serif !important; }
.info-box-text { color: var(--muted) !important; }

/* FOOTER */
.main-footer {
  background: var(--bg2) !important;
  border-top: 1px solid var(--border) !important;
  color: var(--muted) !important;
  font-size: 0.8rem !important;
}

/* LOGIN PAGE */
.login-page, .login-box {
  background: var(--bg) !important;
}
.login-box {
  background: var(--surface) !important;
  border: 1px solid var(--border) !important;
  border-radius: 12px !important;
  box-shadow: 0 24px 60px rgba(0,0,0,0.5) !important;
}
.login-box-header {
  background: var(--surface2) !important;
  border-bottom: 1px solid var(--border) !important;
  border-radius: 12px 12px 0 0 !important;
  font-family: "Cinzel", serif !important;
}
.login-logo a {
  font-family: "Cinzel", serif !important;
  font-size: 1.5rem !important;
  font-weight: 700 !important;
  background: linear-gradient(135deg, var(--gold), var(--gold2)) !important;
  -webkit-background-clip: text !important;
  -webkit-text-fill-color: transparent !important;
}

/* GLOW EFFECT ON ACTIVE ELEMENTS */
.btn-primary:focus, .btn-info:focus {
  box-shadow: 0 0 0 3px rgba(108,127,255,0.3) !important;
}

/* CONSOLE / TERMINAL */
.xterm, .terminal {
  background: #020308 !important;
}

/* OVERRIDE BOOTSTRAP COLORS */
.text-primary { color: var(--accent) !important; }
.text-success { color: var(--green) !important; }
.text-danger { color: var(--red) !important; }
.text-warning { color: var(--gold2) !important; }
.text-info { color: var(--accent2) !important; }
.bg-primary { background: var(--accent) !important; }
.bg-success { background: var(--green) !important; }
.bg-danger { background: var(--red) !important; }
.bg-warning { background: var(--gold) !important; }
'

# ==========================================
#   INJECT CSS TO CLIENT PANEL
# ==========================================

echo -e "${BLUE}[→] Menginjeksi theme ke client panel...${NC}"

# Cek apakah file CSS publik ada
CSS_CLIENT="$PTERO_PATH/public/themes/pterodactyl/css/pterodactyl.css"
if [ -f "$CSS_CLIENT" ]; then
    echo "$ASTROVA_CSS" >> "$CSS_CLIENT"
    echo -e "${GREEN}[✓] CSS client panel berhasil diinjeksi!${NC}"
else
    # Buat folder dan file kalau belum ada
    mkdir -p "$(dirname "$CSS_CLIENT")"
    echo "$ASTROVA_CSS" > "$CSS_CLIENT"
    echo -e "${GREEN}[✓] File CSS client panel dibuat dan diinjeksi!${NC}"
fi

# ==========================================
#   INJECT CSS TO ADMIN PANEL
# ==========================================

echo -e "${BLUE}[→] Menginjeksi theme ke admin panel...${NC}"

ADMIN_LAYOUT="$PTERO_PATH/resources/views/layouts/admin.blade.php"
if [ -f "$ADMIN_LAYOUT" ]; then
    # Cek apakah sudah diinjeksi sebelumnya
    if grep -q "astrova-theme" "$ADMIN_LAYOUT"; then
        echo -e "${YELLOW}[!] Theme admin sudah terinjeksi sebelumnya, skip.${NC}"
    else
        # Buat file CSS admin
        ADMIN_CSS_DIR="$PTERO_PATH/public/css"
        mkdir -p "$ADMIN_CSS_DIR"
        echo "$ASTROVA_CSS" > "$ADMIN_CSS_DIR/astrova-admin.css"

        # Inject <link> ke admin layout sebelum </head>
        sed -i 's|</head>|    <link rel="stylesheet" href="/css/astrova-admin.css"><!-- astrova-theme -->\n</head>|' "$ADMIN_LAYOUT"
        echo -e "${GREEN}[✓] CSS admin panel berhasil diinjeksi!${NC}"
    fi
else
    echo -e "${YELLOW}[!] File admin layout tidak ditemukan: $ADMIN_LAYOUT${NC}"
fi

# ==========================================
#   INJECT GOOGLE FONTS TO CLIENT BLADE
# ==========================================

CLIENT_LAYOUT="$PTERO_PATH/resources/views/layouts/master.blade.php"
if [ -f "$CLIENT_LAYOUT" ]; then
    if ! grep -q "Cinzel" "$CLIENT_LAYOUT"; then
        sed -i 's|</head>|    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600;700;900\&family=Raleway:wght@300;400;500;600\&display=swap" rel="stylesheet">\n</head>|' "$CLIENT_LAYOUT"
        echo -e "${GREEN}[✓] Google Fonts diinjeksi ke client layout!${NC}"
    fi
fi

# ==========================================
#   CLEAR CACHE
# ==========================================

echo -e "${BLUE}[→] Membersihkan cache...${NC}"
cd "$PTERO_PATH" && php artisan view:clear 2>/dev/null && php artisan cache:clear 2>/dev/null
echo -e "${GREEN}[✓] Cache dibersihkan!${NC}"

# ==========================================
#   DONE
# ==========================================

echo ""
echo -e "${CYAN}╔═══════════════════════════════════════╗${NC}"
echo -e "${CYAN}║         INSTALASI SELESAI! ✓          ║${NC}"
echo -e "${CYAN}╚═══════════════════════════════════════╝${NC}"
echo ""
echo -e "  ${GREEN}✓ Theme AstrovaHost berhasil diinstall!${NC}"
echo -e "  ${YELLOW}→ Refresh browser kamu (Ctrl+Shift+R)${NC}"
echo -e "  ${YELLOW}→ Backup tersimpan di: ${BACKUP_DIR}${NC}"
echo ""
echo -e "  ${BLUE}Untuk uninstall, restore file dari folder backup.${NC}"
echo ""
