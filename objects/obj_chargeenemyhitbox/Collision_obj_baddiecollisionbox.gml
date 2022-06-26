if instance_exists(other.baddieID)
{
    if ((!other.baddieID.elite) or other.baddieID.elitehit <= 0)
    {
        if (other.baddieID != baddieID && (!other.baddieID.invincible) && other.baddieID.killbyenemy && other.baddieID.destroyable && other.baddieID.state != (4 << 0))
            instance_destroy(other.baddieID)
    }
}
