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

# 4. Persistent volume is configured in railway.toml
# Volume automatically mounts to /home/node/.n8n for SQLite database and workflow data

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

## 🔑 Key Insights

### Your Current Config vs Competition

| Provider | Minimum Cost | Your Setup Advantage |
|----------|--------------|---------------------|
| n8n Cloud | $20/month | 75% cheaper |
| Zapier | $20-30/month | 80% cheaper, full control |
| Make.com | $9-29/month | 50% cheaper, self-hosted |
| **Your Railway Setup** | **$4-5/month** | **Best value for features** |

### SQLite is Fine Until...

✅ **SQLite handles perfectly:**
- <10 active workflows
- <1000 executions/day
- Single-tenant usage
- Sequential workflow execution
- Up to 5GB database size

❌ **Upgrade to PostgreSQL when:**
- Workflows fail with "database locked" errors
- 1000+ daily executions sustained
- Multiple workflows running simultaneously
- Clients demand 99%+ uptime
- You charge >$500/month total revenue

---

## 💡 Configuration Recommendations

### DO NOT DOWNGRADE ❌

Your current config is the minimum viable for real clients. Saving $1-2/month will cost you in:
- Debugging time (lost execution history)
- Client trust (preventable failures)
- Your sanity (minimal logging)

### DO NOT UPGRADE YET ✅

Wait until you hit these triggers:
1. Consistent 500+ executions/day
2. 10+ active client workflows
3. First "database locked" error
4. Client requests SLA agreement

### DO OPTIMIZE 🎯

Add these to your current setup:

**Better Backup Strategy:**
```bash
# Weekly automated backups (add to Railway cron or external)
railway volume backup n8n_data
```

**Monitor Usage:**
```bash
# Check execution count weekly
railway run sh -c "sqlite3 /home/node/.n8n/database.sqlite 'SELECT COUNT(*) FROM execution_entity'"
```

**Client Communication:**
- Set expectation: "This is a cost-optimized production environment"
- SLA: "Best effort, 95% uptime target"
- Pricing: Build in upgrade costs ($10/month PostgreSQL at client #10)

---

## 🎬 Bottom Line

**Your current configuration IS the "very best n8n instance for small teams with full functionality" at the $5/month price point.**

**Value Proposition:**
- 100% of n8n features for 20% of n8n Cloud cost
- Scales linearly with client growth
- Clear upgrade path when needed
- No premature optimization

**For your first 1-10 real clients:** You're perfectly positioned. The only improvements we suggest are operational (backups, monitoring), not infrastructure upgrades.

---

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

### Data Not Persisting Across Deployments
1. Verify volume is configured in `railway.toml`:
   ```toml
   [[deploy.volumes]]
   mountPath = "/home/node/.n8n"
   ```
2. Check volume is mounted: `railway run sh -c "ls -la /home/node/.n8n"`
3. Verify SQLite database exists: `railway run sh -c "ls -la /home/node/.n8n/database.sqlite"`

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