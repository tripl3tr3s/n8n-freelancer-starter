# 🔒 Security Guidelines

## Credentials Management

### What Goes Where

| Type | File | Committed to Git? | Purpose |
|------|------|------------------|---------|
| Template defaults | `environment.example` | ✅ Yes | Public template defaults |
| Personal secrets | `.env.local` | ❌ Never | Your private credentials |
| Railway deployment | Railway Dashboard | ❌ Never | Production environment variables |

### Files You Should NEVER Commit

```bash
.env
.env.local
.env.*.local
.n8n/
*.db
*.db-shm
*.db-wal
```

These are already in `.gitignore` to protect you.

## 🎓 Course Credentials

If you're enrolled in the n8n Level 1 course, you received personal credentials:
- Unique ID
- Webhook URL
- Dataset URL
- API Key

**These are PERSONAL to you.** Store them in `.env.local` (never committed).

## 🚀 Production Deployments

### For Your Learning Instance

⚠️ **IMPORTANT:** Do NOT set course credentials as Railway environment variables!

Your course credentials are stored in `.env.local` (git-ignored). Use them in n8n workflows:

**Option 1: n8n Credentials (Recommended)**
1. Go to n8n UI > Credentials > Add Credential
2. Choose "Header Auth" or "Generic"
3. Enter your course API key from `.env.local`
4. Reference in workflow nodes

**Option 2: Hardcoded (Learning Only)**
- Use values from `.env.local` directly in HTTP Request nodes
- Only for course exercises, never for production

See `.env.local` for your credentials and detailed usage instructions.

### For Client Deployments
Clients **don't need** course credentials. Each client gets:
- Their own `N8N_BASIC_AUTH_USER` and password
- Their own Railway domain
- Their own workflows and data
- Course credentials are never needed for client work

## 🛡️ Best Practices

### 1. Strong Passwords
```bash
# Generate a secure password
openssl rand -base64 32
```

### 2. Separate Instances Per Client
Don't share one n8n instance across clients. Deploy separate instances:
```bash
railway init --name client-acme-corp
railway up
```

### 3. Regular Credential Rotation
Change passwords every 90 days for production instances.

### 4. Webhook Authentication
Always add authentication to webhook triggers:
- Use header authentication
- Rotate webhook URLs if compromised
- Enable HTTPS only (Railway does this automatically)

### 5. Backup Strategy
Railway volumes can be backed up:
```bash
# Create manual backup before major changes
railway volume backup n8n_data
```

## 🚨 What To Do If Credentials Leak

### If Course Credentials Leak
1. Contact n8n support immediately
2. They may be able to regenerate them
3. Remove from any public repositories

### If Client Credentials Leak
1. Change password immediately in Railway dashboard
2. Rotate affected webhook URLs
3. Notify client
4. Review access logs

## 📞 Reporting Security Issues

Found a security vulnerability in this template?
- **DO NOT** open a public GitHub issue
- Email: [Create a GitHub Security Advisory](https://github.com/tripl3tr3s/n8n-freelancer-starter/security/advisories)

## ✅ Security Checklist

Before deploying for a client:

- [ ] Changed default admin username
- [ ] Set strong password (16+ characters)
- [ ] Removed any personal credentials
- [ ] Enabled HTTPS (Railway does this automatically)
- [ ] Set up execution pruning
- [ ] Documented credentials securely (use password manager)
- [ ] Tested webhook authentication
- [ ] Verified domain is not publicly listed

---

**Remember:** Security is not a feature, it's a practice. Stay vigilant! 🛡️