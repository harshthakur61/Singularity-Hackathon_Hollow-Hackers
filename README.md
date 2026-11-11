# 🏥 BedLink — Real-Time Emergency Bed Allocation, Ambulance Dispatch & AI Diagnostics

> **BedLink** connects ambulances, emergency hospital bed inventories, and patients in real-time, eliminating critical delays during medical transit through automated weighted matching, 120-second hold cascades, and AI medical analysis.

**Team Name:** Hollow Hakcers (Harsh Thakur, Saurabh Vaishya)  
**Hackathon:** Singularity 2.0  
**Track:** Health & Emergency Services  

---

## 📱 Release APK & Installation Steps

Judges can install the release build directly onto any Android device:
- **APK Location in Repository:** `dist/BedLink-v1.0.apk`
- **Build Output:** `build/app/outputs/flutter-apk/app-release.apk`
- **Application ID:** `com.bedlink.bedlink`
- **Version:** `1.0.0+1`

### 📥 How to Install on Android

1. **Transfer or Download the APK:**  
   Copy `dist/BedLink-v1.0.apk` to your Android device via USB, Google Drive, or local storage.
2. **Allow Installation from Unknown Sources:**  
   When prompted by Android, tap **Settings** and enable **"Allow from this source"** (or enable *Install unknown apps* for your File Manager/Browser).
3. **Install the App:**  
   Tap **Install** and wait for the package installer to complete.
4. **Grant Runtime Permissions:**  
   Open **BedLink**. When prompted, grant:
   - **Location Permission (Fine / Precise GPS):** Required for ambulance routing, nearby hospital ranking, and telemetry.
   - **Notification Permission (POST_NOTIFICATIONS):** Required for 120-second emergency bed request alerts and audible siren dispatch pings.
   - **Microphone Permission (Optional):** Used if recording clinical audio notes for destination nurses during transit.

---

## 🔑 Demo Credentials

BedLink features dedicated portals for **Hospital Nurses**, **Ambulance Crews**, and **Patients**. Pre-configured demo shortcuts are built into each login screen for rapid evaluation.

| Role | Login Screen / Flow | Identifier / Field 1 (Placeholder) | Secret / Field 2 (Placeholder) | 1-Tap Quick Demo Action |
| :--- | :--- | :--- | :--- | :--- |
| **Hospital Nurse** | `/nurse/login` | Select Hospital: `[e.g., Lilavati Hospital]` | 4-Digit Security PIN: `[e.g., 1234]` | Select any seeded hospital from dropdown and enter the 4-digit PIN |
| **Ambulance Crew (Alpha)** | `/crew/login` | Application Ref: `[e.g., APP-DEMO100]` | Password: `[e.g., password123]` | Tap **"1-Tap Quick Demo Login (Crew Alpha)"** |
| **Ambulance Crew (Beta)** | `/crew/login` | Application Ref: `[e.g., APP-DEMO200]` | Password: `[e.g., password123]` | Tap **"1-Tap Quick Demo Login (Crew Beta)"** |
| **Patient Portal** | `/patient/login` | Phone: `[e.g., +91 98765 43210]` | Password: `[e.g., patient123]` | Tap **"1-Tap Quick Demo Login"** |

> *Note: For judging convenience, tapping the 1-tap demo buttons authenticates instantly and redirects directly to the respective portal home screens.*

---

## 🔄 How to Test the Flow

To test the multi-party emergency response workflow, run two sessions (either on two phones, or one phone and an emulator/web instance):

### 1. Emergency Request & 120-Second Hold Flow
1. **Set Up Receiving Hospital Terminal:**
   - Log in as a **Hospital Nurse** (`/nurse/login`).
   - Select a target hospital (e.g., *Lilavati Hospital*) and enter the PIN (`1234`).
   - The station status shows **ONLINE 🟢**. Keep the Nurse Dashboard visible on the Requests/Beds tab.
2. **Dispatch an Ambulance:**
   - On the second device, log in as **Ambulance Crew Alpha** (`/crew/login`).
   - Tap **"New Emergency Request"**.
   - Select the required clinical bed care (e.g., **ICU** or **Ventilator**).
   - Enter/confirm patient location coordinates, then tap **"Find Ranked Hospitals"**.
3. **Weighted Ranking & Hold Request:**
   - BedLink evaluates road distance, OSRM driving ETA, bed availability, capacity load, and data freshness.
   - Tap **"Request 2-Min Hold"** on the highest-ranked hospital.
4. **Nurse Acceptance (Within 120s):**
   - The 120-second hold countdown begins immediately on the ambulance screen.
   - The Nurse Terminal sounds an emergency audio chime and displays an incoming dispatch banner.
   - Nurse taps **"Accept Bed Request"**. *(If rejected or if the 120s timer expires, BedLink automatically cascades to the next best hospital).*
5. **Turn-by-Turn Navigation & Handover:**
   - Upon acceptance, the ambulance terminal transitions to live turn-by-turn map navigation with ETA and OSRM geometry.
   - Once the ambulance reaches the emergency bay, the crew taps **"Mark Arrived"** to complete handover and release the hold.

### 2. Breakdown Rescue (Relief Request) Flow
1. **Trigger Mechanical Breakdown:**
   - While on an active transit navigation screen, tap the **"Ambulance Breakdown / Request Relief"** button.
   - Specify the breakdown reason (e.g., *Engine Failure* or *Flat Tire*).
2. **Relief Broadcast & Transfer:**
   - An emergency relief broadcast is immediately dispatched to nearby active ambulances.
   - Log in as **Crew Beta** on a second device to receive the relief prompt.
   - Crew Beta accepts the relief dispatch; live telemetry links the relief vehicle to the stranded crew's exact GPS location.
   - The receiving hospital's terminal is automatically updated with the new relief ambulance details.

---

## 🛠️ Technology Stack

- **Mobile Client:** Flutter (Channel stable, v3.13+), Dart (v3.0+)
- **State Management & Architecture:** Flutter Riverpod (`flutter_riverpod`)
- **Navigation:** GoRouter (`go_router`)
- **Backend & Database:** Firebase Firestore (real-time listeners & offline sync)
- **Cloud Infrastructure:** Firebase Cloud Functions v2 (TypeScript / Node.js)
- **Push & Background Alerts:** Firebase Cloud Messaging (FCM) & `flutter_local_notifications`
- **Maps & Geolocation:** `flutter_map`, `latlong2`, `geolocator`
- **Road Routing & Geometry:** OSRM (Open Source Routing Machine) REST API
- **AI Diagnostics:** OpenRouter API (`google/gemini-2.5-flash-lite`) with local rule-based fallback
- **Payments (OPD Consultations):** Razorpay SDK (`razorpay_flutter` - Test Sandbox Mode)
- **Media & Audio:** `record`, `audioplayers`, `file_picker`, `image_picker`

---

## ⚠️ Known Limitations

- **Mobile Data & GPS Required:** Real-time dispatch, OSRM turn-by-turn routing, and live telemetry updates require an active internet connection (Wi-Fi or cellular data) and enabled device GPS hardware.
- **Nurse Terminal Onboarding:** For accurate live bed allocation, destination hospital nurse stations must be actively logged in. If a hospital's nurse terminal is offline or has zero requested beds, BedLink's automated 0s auto-skip activates to immediately route patients to the next responsive emergency center.
- **AI Multimodal Limits:** Online AI report analysis requires network connectivity to reach OpenRouter; in offline scenarios, the system automatically triggers the built-in deterministic heuristic fallback engine.

---

## 👥 Team: Hollow Hakcers

- **Harsh Thakur**
- **Saurabh Vaishya**

*Singularity 2.0 Hackathon — Health & Emergency Services Track*
