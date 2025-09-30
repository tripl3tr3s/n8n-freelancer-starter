# 🚀 n8n Freelancer Starter - Ultra-Lean Railway Template

> Deploy n8n on Railway for ~$3-5/month - Perfect for freelancers, consultants, and small teams

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/n8n-freelancer)

## 🎯 What This Is

An ultra-lean n8n deployment optimized for:
- **Freelancers & Consultants** starting automation businesses
- **Small Teams** (1-10 active clients)
- **Cost-Conscious Operations** (~$3-5/month)
- **Mexican PYME Market** (Spanish locale, timezone configured)

## ✨ Features

✅ **Full n8n Functionality** - All 400+ integrations work
✅ **HTTPS Webhooks** - Production-ready webhook triggers
✅ **Secure by Default** - Basic authentication enabled
✅ **SQLite Database** - No PostgreSQL overhead
✅ **Auto-Cleanup** - 7-day execution retention
✅ **Mexican Localization** - America/Mexico_City timezone, Spanish UI
✅ **Resource Optimized** - Minimal CPU/RAM usage

## 💰 Cost Breakdown

```
Railway Hobby Plan: $5/month (includes $5 free credit)
Expected Usage:      ~$3-5/month
- Compute: ~$2-3/month (0.1-0.2 vCPU)
- Storage: ~$1/month (1GB volume)
- Bandwidth: Included

Total: $3-5/month for 1-10 workflows
```

## 🚀 Quick Deploy

### Option 1: One-Click Railway Deploy (Recommended)

1. Click the "Deploy on Railway" button above
2. Connect your GitHub account
3. Set your authentication credentials:
   - `N8N_BASIC_AUTH_USER`: Your username
   - `N8N_BASIC_AUTH_PASSWORD`: Strong password
4. Wait 2-3 minutes for deployment
5. Access your n8n instance at the generated Railway URL

### Option 2: Manual Deployment

#### Prerequisites
- Railway account ([sign up free](https://railway.app))
- Railway CLI installed: `npm i -g @railway/cli`
- Git installed

#### Steps

```bash
# 1. Clone this repository
git clone https://github.com/tripl3tr3s/n8n-freelancer-starter.git
cd n8n-freelancer-starter

# 2. Login to Railway
railway login

# 3. Create new project
railway init

# 4. Add persistent volume
railway volume create --name n8n_data --mount /home/node/.n8n

# 5. Set environment variables
railway variables set N8N_BASIC_AUTH_ACTIVE=true
railway variables set N8N_BASIC_AUTH_USER=admin
railway variables set N8N_BASIC_AUTH_PASSWORD=your-secure-password
railway variables set DB_TYPE=sqlite
railway variables set EXECUTIONS_DATA_PRUNE=true
railway variables set EXECUTIONS_DATA_MAX_AGE=168
railway variables set GENERIC_TIMEZONE=America/Mexico_City
railway variables set N8N_METRICS=false
railway variables set N8N_DIAGNOSTICS_ENABLED=false

# 6. Deploy
railway up

# 7. Generate public domain
railway domain
```

## 🔧 Configuration

### Required Environment Variables

| Variable | Value | Description |
|----------|-------|-------------|
| `N8N_BASIC_AUTH_ACTIVE` | `true` | Enable password protection |
| `N8N_BASIC_AUTH_USER` | Your choice | Admin username |
| `N8N_BASIC_AUTH_PASSWORD` | Your choice | Admin password (use strong password!) |
| `DB_TYPE` | `sqlite` | Use SQLite for cost optimization |
| `EXECUTIONS_DATA_PRUNE` | `true` | Auto-delete old executions |
| `EXECUTIONS_DATA_MAX_AGE` | `168` | Keep 7 days of history |

### Recommended Environment Variables

| Variable | Value | Description |
|----------|-------|-------------|
| `GENERIC_TIMEZONE` | `America/Mexico_City` | Set your timezone |
| `N8N_DEFAULT_LOCALE` | `es` | Spanish UI |
| `N8N_METRICS` | `false` | Disable metrics (saves resources) |
| `N8N_DIAGNOSTICS_ENABLED` | `false` | Disable diagnostics |
| `N8N_LOG_LEVEL` | `warn` | Reduce logging overhead |

See `environment.example` for complete configuration options.

## 📊 What You Can Do With This Setup

### Capacity
- **Workflows**: 1-10 active workflows
- **Executions**: <1000/day
- **Storage**: 1GB (SQLite database + execution data)
- **Clients**: 5-10 concurrent clients

### Perfect For
- Learning n8n automation
- Building demo workflows
- First 5-10 client deployments
- Testing business viability
- Course projects

### Not Suitable For
- High-volume production (>1000 executions/day)
- Large teams (>10 concurrent users)
- Complex multi-worker setups
- Enterprise-grade reliability

## 🔒 Security Best Practices

1. **Strong Passwords**: Use 16+ character passwords
2. **Regular Updates**: n8n updates automatically on Railway
3. **Webhook Security**: Use webhook authentication for sensitive triggers
4. **Credential Encryption**: n8n encrypts stored credentials by default
5. **HTTPS Only**: Railway provides automatic SSL

## 📈 Upgrade Path

When you outgrow this setup:

### Upgrade to PostgreSQL (~$10-15/month)
```bash
# Add Railway PostgreSQL plugin
railway add postgresql

# Update environment variables
railway variables set DB_TYPE=postgresdb
railway variables set DB_POSTGRESDB_HOST=${{RAILWAY_POSTGRES_HOST}}
railway variables set DB_POSTGRESDB_PORT=${{RAILWAY_POSTGRES_PORT}}
railway variables set DB_POSTGRESDB_DATABASE=${{RAILWAY_POSTGRES_DATABASE}}
railway variables set DB_POSTGRESDB_USER=${{RAILWAY_POSTGRES_USER}}
railway variables set DB_POSTGRESDB_PASSWORD=${{RAILWAY_POSTGRES_PASSWORD}}

# Redeploy
railway up
```

### Add Workers (~$20-30/month)
- Enable `EXECUTIONS_PROCESS=own` for main + worker mode
- Add Redis for queue management
- Scale horizontally with multiple workers

See `docs/UPGRADE_PATH.md` for detailed migration guides.

## 🐛 Troubleshooting

### Can't Access n8n UI
1. Check Railway logs: `railway logs`
2. Verify domain is active: `railway domain`
3. Wait 2-3 minutes after deployment

### "Authentication Failed"
1. Verify credentials in Railway dashboard
2. Check environment variables: `railway variables`
3. Try resetting password

### Workflows Not Executing
1. Check execution history in n8n UI
2. Review Railway logs for errors
3. Verify webhook URLs are HTTPS

### High Costs
1. Review Railway usage dashboard
2. Reduce execution frequency
3. Enable execution pruning
4. Disable unused workflows

See `docs/TROUBLESHOOTING.md` for complete guide.

## 📚 Resources

- [n8n Documentation](https://docs.n8n.io)
- [Railway Documentation](https://docs.railway.app)
- [n8n Community Forum](https://community.n8n.io)
- [Railway Discord](https://discord.gg/railway)

## 🌟 Mexican PYME Use Cases

This template is optimized for Mexican market automation:

### WhatsApp Business Integration
- Connect WhatsApp Business API
- Automate customer responses
- Send order confirmations

### SAT/Tax Compliance
- Parse SAT invoices (CFDI XML)
- Generate compliance reports
- Automate tax filing reminders

### E-commerce Automation
- Order processing from Mercado Libre/Amazon MX
- Inventory sync across platforms
- Customer notification sequences

### CRM Integration
- Sync contacts to Google Sheets
- Automate follow-ups via WhatsApp
- Track sales pipeline

## 🤝 Contributing

This template is open source and welcomes contributions:

1. Fork this repository
2. Create feature branch: `git checkout -b feature/improvement`
3. Commit changes: `git commit -am 'Add improvement'`
4. Push to branch: `git push origin feature/improvement`
5. Submit pull request

## 📄 License

MIT License - See LICENSE file for details

## 🙏 Acknowledgments

- Built with [n8n](https://n8n.io) - Fair-code automation platform
- Deployed on [Railway](https://railway.app) - Infrastructure platform
- Optimized for Mexican PYME market

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/tripl3tr3s/n8n-freelancer-starter/issues)
- **Discussions**: [GitHub Discussions](https://github.com/tripl3tr3s/n8n-freelancer-starter/discussions)
- **Business Inquiries**: Create issue with `business` label

---

**Built with ❤️ for the Mexican automation community**

*Deploy once, automate everything.* 🚀